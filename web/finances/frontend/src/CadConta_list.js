import React, { useEffect,useState } from "react";
import api from './services/api';

import "./table.css";

function CadConta_list() {

  const [bills,SetBills] = useState([]);

  useEffect(()=>{      
      api.get('/bills',{}).then(response => {
          if (Array.isArray(response.data)) {
              SetBills(response.data);
          }
      })
  },[]);  

    return (
      <div className="CadConta_list">
        <div class="flex-1 bg-gray-300 h-screen">
          <header class="py-4 grid grid-cols-6 border-b-2 border-gray-600">
          <h1 class="text-center col-start-2 col-end-6 font-bold md:text-2xl text-gray-600">Cadastro de Conta Fixa</h1>      
          </header>
                                  
          <div class="overflow-auto h-auto text-sm md:text-base rounded-lg m-2 shadow">
            <table class="table-auto w-full bg-white">
                <thead class="text-left bg-gray-700 border-b-2 border-gray-900">
                    <tr>
                    <th class="px-2 py-2 text-white">Conta</th>
                    <th class="px-2 py-2 text-white hidden md:flex">Categoria</th>
                    <th class="px-2 py-2 text-white">Início</th>
                    <th class="px-2 py-2 text-white hidden md:flex">Término</th>
                    <th class="px-2 py-2 text-white text-right md:pr-8 md:w-24">Valor</th>
                    <th class="px-2 py-2 text-white hidden md:flex md:w-8">Venc.</th>
                    <th class="px-2 py-2 right-0 w-8 md:w-64"></th>
                    </tr>
                </thead>
                <tbody>
                    {bills.map(b => (
                        <tr key={b.id}>
                            <td class="px-2 py-2">{b.description}</td>
                            <td class="px-2 py-2 hidden md:flex">{b.cat_description}</td>
                            <td class="px-2 py-2">{b.first_date}</td>
                            <td class="px-2 py-2 hidden md:flex">{b.last_date}</td>
                            <td class="px-2 py-2 font-semibold text-right md:pr-8">
                                {Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(b.value)}
                            </td>
                            <td class="px-2 py-2 hidden md:flex">{b.due_day}</td>
                            <td class="px-2 py-2">
                              <div class="hidden md:flex">
                                <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2 mr-2">Editar</button>
                                <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2 mr-2">Finalizar</button>
                                <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2">Excluir</button>                              
                              </div>
                              <div class="flex md:hidden">
                                <button class="bg-blue-500 hover:bg-blue-700 rounded w-6 text-center font-bold text-white px-2 mr-2">i</button>
                              </div>                              
                            </td>
                        </tr>                            
                    ))}                        
                </tbody>
            </table>            
          </div>                      
        </div>                
      </div>
    );
  
}

export default CadConta_list;
