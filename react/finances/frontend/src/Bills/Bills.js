import React, { useEffect,useState } from "react";
import api from '../services/api';
import {
  NavLink,
  HashRouter
} from "react-router-dom";
import Header from "../Header";

import "../table.css";

function Bills() {

  const [bills,SetBills] = useState([]);
  const [bill,SetBill] = useState({value: 0});

  useEffect(()=>{      
      api.get('/bills',{}).then(response => {
          if (Array.isArray(response.data)) {
              SetBills(response.data);
          }
      })
  },[]);  

  async function handleDeleteBill(id) {
    if(id==null) {
      return;
    }
    try {
        if (window.confirm('Confirma exclusão?')) {
          await api.delete(`/bill/${id}`,{}).then(response => {
            if (response.status === 200) {
              alert(response.data.erros[0].mensagem);
            } else {
              SetBills(bills.filter(bills => bills.id !== id)); 
              SetBill({value: 0});                  
            }                      
          });          
        }        
    } catch (err) {
        alert('Erro ao excluir conta, tente novamente.');
    };
  };
  
  async function targetGrid(reg) {
    SetBill(reg);
  };

    return (
      <div className="Bills">
        <div class="flex-1 bg-gray-300 h-screen">
          <Header name="Cadastro de Contas" />        
          <div class="md:overflow-auto h-screen">
            <HashRouter>
            
              <div class="pt-2 px-2">
                <NavLink to="/bill" class="" >
                  <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-4 py-2">Nova Conta</button>                                
                </NavLink>
              </div>  

              <div class="overflow-auto md:hidden h-auto text-sm md:text-base rounded-lg m-2 shadow bg-white">
              
                <div class="flex flex-col"> 
                
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Conta: </text>
                    <text class="p-1 pl-4 w-3/4">{bill.description}</text>                   
                  </div>
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Categoria: </text>
                    <text class="p-1 pl-4 w-3/4">{bill.cat_description}</text> 
                  </div>                
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Início: </text>
                  <text class="p-1 pl-4 w-3/4">{bill.first_date}</text> 
                  </div>
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Término: </text>
                    <text class="p-1 pl-4 w-3/4">{bill.last_date}</text> 
                  </div>
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Valor: </text>
                    <text class="p-1 pl-4 w-3/4 font-semibold">{Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(bill.value)}</text> 
                  </div>
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Vencimento: </text>
                    <text class="p-1 pl-4 w-3/4">Dia {bill.due_day}</text> 
                  </div>
                  <div class="flex">
                    <text class="font-bold bg-gray-700 text-white p-1 pl-2 w-1/4 border-r-2 border-gray-900">Ações: </text>
                    <div class="p-1 pl-4 w-3/4">                      
                      <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white h-6 px-2 mr-2">Finalizar</button>
                      <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white h-6 px-2 " onClick={() => handleDeleteBill(bill.id)}>Excluir</button>                                                    
                    </div> 
                  </div>
                </div>
              </div>                             

              <div class="overflow-auto flex flex-col bg-white h-64 md:h-auto text-sm md:text-base rounded-lg m-2 shadow" >
                <table class="w-full bg-white table-auto">
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
                    <tbody class="">
                        
                        {bills.map(b => (
                            <tr key={b.id} onClick={() => targetGrid(b)} class="">
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
                                    <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2 mr-2">Finalizar</button>
                                    <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2" onClick={() => handleDeleteBill(b.id)}>Excluir</button>                              
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
            <div class="md:pb-24"></div>                                                            
          </HashRouter>
        </div>                                
      </div>
    </div>
    );
  
}

export default Bills;
