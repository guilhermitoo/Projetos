import React, {useEffect,useState} from 'react';
import { FaTrashAlt, FaHandPointDown } from 'react-icons/fa';
import './tailwind.generated.css';
import Modal from 'react-modal';

import api from './services/api';

import "./table.css";

const customStyles = {
    content : {
      top                   : '50%',
      left                  : '50%',
      right                 : 'auto',
      bottom                : 'auto',
      marginRight           : '-50%',
      transform             : 'translate(-50%, -50%)',

    },
    overlay :{
        background : 'rgba(145, 145, 145, 0.75)'
    }
  };

  Modal.setAppElement('#root')

function Pagar(props) {    
    const [modalIsOpen,setIsOpen] = useState(false);        
    const _month = localStorage.getItem("_month");
    const _year = localStorage.getItem("_year");
    const [openPayments,SetOpenPayments] = useState([]);
    const [paidPayments,SetPaidPayments] = useState([]);
    const [payment_types,SetPaymentTypes] = useState([]);    
    const [payment_description,SetPaymentDescription] = useState('');

    // variável para controle nos modais de pagamento
    const [id_bill,SetIdBill] = useState(-1);    
    const [resolution_day,SetResolutionDay] = useState(0);
    const [payment_type,SetPaymentType] = useState(0);
    const [value,SetValue] = useState(0);

    useEffect(()=>{
        loadBills();
        api.get('/payment_types',{}).then(response => {
            if (Array.isArray(response.data)) {
              if (response.data.length > 0) {
                SetPaymentTypes(response.data);            
                SetPaymentType(response.data[0].id);
              }                        
            }
        });
        resetPayment();
    },[_month,_year]);

    function openModal(obj) {
        SetPaymentDescription(obj.description);        
        var dt = new Date();
        SetResolutionDay(dt.getDate());
        SetValue(obj.value);
        SetIdBill(obj.bill_id);
        setIsOpen(true);
    }

    function loadBills() {
        api.get('/open?year='+_year+'&month='+_month+'&type='+props.type,{}).then(response => {
            if (Array.isArray(response.data["bills"])) {
                SetOpenPayments(response.data.bills);
            }
        });
        api.get('/paid?year='+_year+'&month='+_month+'&type='+props.type,{}).then(response => {
            if (Array.isArray(response.data["bills"])) {
                SetPaidPayments(response.data.bills);
            }
        });
    }
    
    function closeModal(){
        setIsOpen(false);
    }      

    function resetPayment() {
        SetIdBill(-1);
        var dt = new Date();
        SetResolutionDay(dt.getDay());
        if (payment_types.length > 0) {
            SetPaymentType(payment_types[0].id);
        }else{
            SetPaymentType(-1);
        }
        SetValue(0);
    }

    function GetTextoPagarReceber() {
        if (props.type === 'P') {
            return 'Pagar'
        } else {
            return 'Receber'
        }
    }

    function GetTextPagoRecebido() {
        if (props.type === 'P') {
            return 'Pagas'
        } else {
            return 'Recebidas'
        }
    }

    async function handlePay(e) {
        e.preventDefault();

        const data= {
            id : id_bill, month : _month, year : _year, resolution_day, payment_type, value, payment_receive : props.type
        };

        try {
            await api.patch('bill/pay', data, {});

            loadBills();
            closeModal();
            resetPayment();
        } catch(err){
            alert('Erro ao '+GetTextoPagarReceber()+' conta, tente novamente.');
        }
    }

    async function handleDeleteMove(move_id) {
        if(move_id==null) {
          return;
        }
        try {
            if (window.confirm('Confirma exclusão?')) {
              await api.delete(`/move/${move_id}`,{}).then(response => {
                if (response.status === 200) {
                  alert(response.data.erros[0].mensagem);
                } else {
                  loadBills();
                }                      
              });          
            }        
        } catch (err) {
            alert('Erro ao excluir movimentação, tente novamente.');
        };
      };

    return (

        <div className={GetTextoPagarReceber()}>	
            {props.texto_pagar}
            <Modal
            isOpen={modalIsOpen}            
            onRequestClose={closeModal}
            style={customStyles}>                                                    
                <div class="h-auto w-auto flex flex-col m-4">  
                    <text class="font-semibold text-lg">{GetTextoPagarReceber()} {payment_description} </text>
                    <form onSubmit={handlePay}>
                        <div class="mt-4">
                            <text class="" >Dia do Pagamento</text>
                            <input type="number" min="1" max="31" onChange={e => SetResolutionDay(e.target.value)} value={resolution_day}
                                class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
                        </div>
                        <div class="mt-4">
                            <text class="">Tipo de Pagamento</text>
                            <select onChange={e => SetPaymentType(e.target.value)}
                                class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal">
                                {payment_types.map(pt => (            
                                    <option value={pt.id}>{pt.description}</option>          
                                ))}
                            </select>                                                
                        </div>       
                        <div class="mt-4">
                            <text class="">Valor</text>
                            <input type="number" onChange={e => SetValue(e.target.value)} value={value}
                                class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal">
                            </input>                                                
                        </div>  
                        <div class="mt-8 flex flex-row">
                            <button type="submit" class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white py-2 px-4">Confirmar Pagamento</button>                                        
                            <div class="pl-2">
                                <button onClick={closeModal} class="bg-red-500 hover:bg-red-700 rounded w-auto text-center font-bold text-white py-2 px-4">Cancelar</button> 
                            </div>     
                        </div>                                                                       
                    </form>                  
                </div>
            </Modal>        

            <div class="p-2">
            <div class="bg-white rounded-lg shadow">
                <div class="bg-gray-700 border-b-2 border-gray-900 rounded-tl-lg rounded-tr-lg ">
                    <h5 class="font-bold text-xl text-white text-center">Contas a {GetTextoPagarReceber()}</h5>
                </div>
                
                <div class="">
                    <table class="table-auto w-full">
                        <thead class="bg-gray-700 text-white border-b-2 border-gray-900 text-left">
                            <tr>
                            <th class="px-2  w-1/3">Descrição</th>
                            <th class="px-2  w-1/5">Venc.</th>
                            <th class="px-2  w-1/5">Valor</th>
                            <th class="px-2 ">Categoria</th>
                            <th class="px-2  w-4 right-0"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {openPayments.map(op => (
                                <tr key={op.id}>
                                    <td class="px-2 py-2">{op.description}</td>
                                    <td class="px-2 py-2">{op.due_day}</td>
                                    <td class="px-2 py-2 text-red-500 font-semibold">
                                        {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(op.value)}
                                    </td>
                                    <td class="px-2 py-2">{op.cat_description}</td>
                                    <td class="px-2"><button onClick={() => openModal(op)} class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2" 
                                        id={"btnPay"+op.id}>
                                        <FaHandPointDown size={12} color="#FFF" class="w-4 py-1 h-6"/></button>
                                    </td>
                                </tr>                            
                            ))}                        
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="p-1"></div>
            <div class="bg-white rounded-lg shadow">
                <div class="bg-gray-700 border-b-2 border-gray-900  rounded-t-lg">
                    <h5 class="font-bold text-xl text-white text-center">Contas {GetTextPagoRecebido()}</h5>
                </div>
                
                <div class="">
                    <table class="table-auto w-full">
                    <thead class="bg-gray-700 text-white border-b-2 border-gray-900 text-left">
                        <tr>
                        <th class="px-2 w-1/3">Descrição</th>
                        <th class="px-2 w-1/5">Dia</th>
                        <th class="px-2 w-1/5">Valor</th>
                        <th class="px-2">Categoria</th>
                        <th class="px-2 w-1/6 text-center">Pagto.</th>
                        <th class="px-2 right-0 w-4"></th>
                        </tr>
                    </thead>
                    <tbody >
                        {paidPayments.map(pp => (
                                <tr key={pp.id} >
                                    <td class="px-2  py-2">{pp.description}</td>
                                    <td class="px-2  py-2">{pp.resolution_day}</td>
                                    <td class="px-2  py-2 text-green-500 font-semibold">
                                        {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(pp.value)}
                                    </td>
                                    <td class="px-2  py-2">{pp.cat_description}</td>
                                    <td class="px-2  py-2 text-center">{pp.payment_type_description}</td>
                                    <td class="px-2"><button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2" 
                                        id={"btnDel"+pp.id} onClick={() => handleDeleteMove(pp.move_id)}> 
                                        <FaTrashAlt size={12} color="#FFF" class="w-4 py-1 h-6"/></button>
                                    </td>
                                </tr>                            
                        ))}                                                
                    </tbody>
                    </table>
                </div>
            </div>
            </div>
        </div>
    );
}

export default Pagar;