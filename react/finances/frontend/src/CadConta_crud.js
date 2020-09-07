import React, { useEffect,useState } from "react";
import api from './services/api';
import {NavLink, useHistory} from "react-router-dom"; 


function CadConta_crud() {
  const [description, SetDescription] = useState('');  
  const [category, SetCategory] = useState(0);  
  const [value, SetValue] = useState(0);
  const [due_day, SetDue_day] = useState(1);
  const [payment_receive, SetPayment_receive] = useState('P');
  const [mt,SetMt] = useState('');

  const history = useHistory();
  
  const [categories,setCategorias] = useState([]);

  useEffect(()=>{      
      api.get('/categories',{}).then(response => {
          if (Array.isArray(response.data)) {
            setCategorias(response.data);
            SetCategory(response.data[0].id);            
                        
          }
      });

      var month = new Date().getMonth() + 1;
      var year = new Date().getFullYear();
    
      if (month < 10) {
        SetMt(year+'-0'+month);              
      }else {
        SetMt(year+'-'+month);              
      }
  },[]);    

  async function handleNewBill(e) {
    e.preventDefault();
        
    var dt = new Date(mt+'-10');

    var month = dt.getMonth()+1;
    var year = dt.getFullYear();
    
    const data= {
      description, category, value, due_day, payment_receive, month, year
    };

    console.log(data);
    
    try {
      await api.post('bill', data, {});
      
      history.push('/cad_conta/list');
    } catch(err){
        alert('Erro ao cadastrar conta, tente novamente.');
    }
  };

    return (
      <div className="CadConta_crud">
        
        <form onSubmit={handleNewBill} class="flex p-2 flex-col">          
          <div class="hidden">
            <text class="">Código do cadastro (ID)</text>  
            <input class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>        
          </div>
          <text class="">Descrição</text>  
          <input value={description} onChange={e => SetDescription(e.target.value)}
            class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Categoria</text>          
          <select value={category} onChange={e => SetCategory(e.target.value)}
            class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal" name="categories" id="categories">          
            {categories.map(c => (            
              <option value={c.id}>{c.description}</option>          
            ))}           
          </select>
          <text class="">Valor</text>
          <input value={value} onChange={e => SetValue(e.target.value)} type="number"
            class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Dia de vencimento</text>
          <input value={due_day} onChange={e => SetDue_day(e.target.value)}
            type="number" min="1" max="31" class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Tipo</text>
          <select value={payment_receive} onChange={e => SetPayment_receive(e.target.value)}
            class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal" name="type" id="type">          
              <option value="P">Pagamento</option>
              <option value="R">Recebimento</option>
          </select>
          <text class="">Primeira cobrança</text>
          <input type="month" value={mt} onChange={e => SetMt(e.target.value)} 
            class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>          
          <div class="pt-4 flex flex-row">                        
            <button type="submit" class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white py-2 px-4">Gravar Registro</button>          
            <NavLink to="/cad_conta/list" class="" >                      
              <div class="px-2">
                <button class="bg-red-500 hover:bg-red-700 rounded w-auto text-center font-bold text-white py-2 px-4">Cancelar</button> 
              </div>
            </NavLink>
          </div>                    

        </form>
      </div>
    );
  
}

export default CadConta_crud;
