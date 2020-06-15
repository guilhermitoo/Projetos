import React, {useEffect,useState} from 'react';
import { FaHandPointDown } from 'react-icons/fa';
import './tailwind.generated.css';

import api from './services/api';

function Receber() {
    const _month = localStorage.getItem("_month");
    const _year = localStorage.getItem("_year");
    const [openReceitps,SetOpenReceitps] = useState([]);
    const [paidReceipts,SetPaidReceipts] = useState([]);

    useEffect(()=>{
        api.get('/open?year='+_year+'&month='+_month+'&type=R',{}).then(response => {
            if (Array.isArray(response.data["bills"])) {
                SetOpenReceitps(response.data.bills);
            }
        })
        api.get('/paid?year='+_year+'&month='+_month+'&type=R',{}).then(response => {
            if (Array.isArray(response.data["bills"])) {
                SetPaidReceipts(response.data.bills);
            }
        })
    },[_month,_year]);

    return (

        <div className="Receber">				
            <div class="p-2">
            <div class="bg-white rounded-lg shadow">
                <div class="bg-orange-300 border-b-2 border-orange-400 rounded-tl-lg rounded-tr-lg p-2">
                    <h5 class="font-bold uppercase text-orange-700 text-center">Contas à receber</h5>
                </div>
                
                <div class="">
                    <table class="table-auto w-full">
                        <thead class="bg-orange-300 text-orange-700 border-b-2 border-orange-400 text-left">
                            <tr>
                            <th class="px-2 py-2">Descrição</th>
                            <th class="px-2 py-2">Venc.</th>
                            <th class="px-2 py-2">Valor</th>
                            <th class="px-2 py-2">Categoria</th>
                            <th class="px-2 py-2 w-4 right-0"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {openReceitps.map(or => (
                                <tr key={or.id}>
                                    <td class="px-2  py-2">{or.description}</td>
                                    <td class="px-2  py-2">{or.due_day}</td>
                                    <td class="px-2  py-2 text-green-600 font-semibold">
                                        {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(or.value)}
                                    </td>
                                    <td class="px-2  py-2">{or.cat_description}</td>
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
                <div class="bg-green-300 border-b-2 border-green-400 rounded-tl-lg rounded-tr-lg p-2">
                    <h5 class="font-bold uppercase text-green-700 text-center">Contas recebidas</h5>
                </div>
                
                <div class="">
                    <table class="table-auto w-full">
                    <thead class="bg-green-300 text-green-700 border-b-2 border-green-400 text-left">                                    
                        <tr>
                        <th class="px-2 py-2">Descrição</th>
                        <th class="px-2 py-2">Dia</th>
                        <th class="px-2 py-2">Valor</th>
                        <th class="px-2 py-2">Categoria</th>
                        <th class="px-2 py-2 w-20 right-0 text-center">Pagto.</th>
                        </tr>
                    </thead>
                    <tbody>
                        {paidReceipts.map(pr => (
                                <tr key={pr.id}>
                                    <td class="px-2  py-2">{pr.description}</td>
                                    <td class="px-2  py-2">{pr.resolution_day}</td>
                                    <td class="px-2  py-2 text-green-500 font-semibold">
                                        {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(pr.value)}
                                    </td>
                                    <td class="px-2  py-2">{pr.cat_description}</td>
                                    <td class="px-2  py-2">{pr.payment_type_description}</td>
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

export default Receber;