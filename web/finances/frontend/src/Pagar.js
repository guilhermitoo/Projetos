import React, {useEffect,useState} from 'react';
import { FaHandPointDown } from 'react-icons/fa';
import './tailwind.generated.css';

import api from './services/api';

function Pagar() {
    const _month = "5";//localStorage.getItem('month');
    const _year = "2020";//localStorage.getItem('year');
    const [openPayments,SetOpenPayments] = useState([]);
    const [paidPayments,SetPaidPayments] = useState([]);

    useEffect(()=>{
        api.get('/open?year='+_year+'&month='+_month+'&type=P',{}).then(response => {
            SetOpenPayments(response.data);
        })
        api.get('/paid?year='+_year+'&month='+_month+'&type=P',{}).then(response => {
            SetPaidPayments(response.data);
        })
    },[_month,_year]);

    return (

        <div className="Pagar">				
            <div class="p-2">
            <div class="bg-white rounded-lg shadow">
                <div class="bg-red-300 border-b-2 border-red-400 rounded-tl-lg rounded-tr-lg p-2">
                    <h5 class="font-bold uppercase text-red-600 text-center">Contas à pagar</h5>
                </div>
                
                <div class="">
                    <table class="table-auto w-full">
                        <thead class="bg-red-300 text-red-600 border-b-2 border-red-400 text-left">
                            <tr>
                            <th class="px-2 py-2">Descrição</th>
                            <th class="px-2 py-2">Venc.</th>
                            <th class="px-2 py-2">Valor</th>
                            <th class="px-2 py-2">Categoria</th>
                            <th class="px-2 py-2 w-4 right-0"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {openPayments.map(op => (
                                <tr key={op.id}>
                                    <td class="px-2  py-2">{op.description}</td>
                                    <td class="px-2  py-2">{op.due_day}</td>
                                    <td class="px-2  py-2 text-red-500 font-semibold">
                                        {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(op.value)}
                                    </td>
                                    <td class="px-2  py-2">{op.cat_description}</td>
                                    <td class="px-2  py-2"><button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2">
                                        <FaHandPointDown size={20} color="#FFF" class="w-4 py-1 h-6"/></button>
                                    </td>
                                </tr>                            
                            ))}                        
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="p-1"></div>
            <div class="bg-white rounded-lg shadow">
                <div class="bg-blue-300 border-b-2 border-blue-400 rounded-tl-lg rounded-tr-lg p-2">
                    <h5 class="font-bold uppercase text-blue-700 text-center">Contas pagas</h5>
                </div>
                
                <div class="">
                    <table class="table-auto w-full">
                    <thead class="bg-blue-300 text-blue-700 border-b-2 border-blue-400 text-left">
                        <tr>
                        <th class="px-2 py-2">Descrição</th>
                        <th class="px-2 py-2">Dia</th>
                        <th class="px-2 py-2">Valor</th>
                        <th class="px-2 py-2">Categoria</th>
                        <th class="px-2 py-2 w-20 right-0 text-center">Pagto.</th>
                        </tr>
                    </thead>
                    <tbody>
                        {paidPayments.map(pp => (
                                <tr key={pp.id}>
                                    <td class="px-2  py-2">{pp.description}</td>
                                    <td class="px-2  py-2">{pp.resolution_day}</td>
                                    <td class="px-2  py-2 text-green-500 font-semibold">
                                        {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(pp.value)}
                                    </td>
                                    <td class="px-2  py-2">{pp.cat_description}</td>
                                    <td class="px-2  py-2">{pp.payment_type_description}</td>
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