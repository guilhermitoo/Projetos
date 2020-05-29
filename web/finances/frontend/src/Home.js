import React from 'react';
import { FaHandPointDown,  FaTrashAlt, FaEdit } from 'react-icons/fa';
import './tailwind.generated.css';

import Pagar from './Pagar';

function Home() {
 
  return (
    <div className="Home">
        <div class="overflow-auto h-screen pb-24 md:pb-5">
        <Pagar />
        
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
                        <tr>
                            <td class="px-2  py-2">Salário Gui</td>
                            <td class="px-2  py-2">5</td>
                            <td class="px-2  py-2 text-blue-700 font-semibold">2207,35</td>
                            <td class="px-2  py-2">Pessoal</td>
                            <td class="px-2  py-2"><button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2">
                                <FaHandPointDown size={20} color="#FFF" class="w-4 py-1 h-6"/></button></td>
                        </tr>
                        <tr class="bg-gray-100">
                            <td class="px-2  py-2">Cartão Rosana (5/6)</td>
                            <td class="px-2  py-2">15</td>
                            <td class="px-2  py-2 text-blue-700 font-semibold">133,00</td>
                            <td class="px-2  py-2">Emp. Cartão</td>
                            <td class="px-2  py-2"><button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2">
                                <FaHandPointDown size={20} color="#FFF" class="w-4 py-1 h-6"/></button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="p-2">				
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
                        <tr>
                            <td class="px-2  py-2">Salário Ana</td>
                            <td class="px-2  py-2">10</td>
                            <td class="px-2  py-2 text-blue-700 font-semibold">1007,35</td>
                            <td class="px-2  py-2">Pessoal</td>
                            <td class="px-2  py-2">NB-Ana</td>
                        </tr>							
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="md:flex md:p-2">
            <div class="md:w-2/3 md:pr-2 p-2 md:p-0">				
                <div class="bg-white rounded-lg shadow">
                    <div class="bg-gray-300 border-b-2 border-gray-400 rounded-tl-lg rounded-tr-lg p-2">
                        <h5 class="font-bold uppercase text-gray-700 text-center">Gastos/Ganhos registrados</h5>
                    </div>
                    
                    <div class="">
                        <table class="table-auto w-full">
                            <thead class="bg-gray-300 text-gray-700 border-b-2 border-gray-400 text-left">
                            <tr>
                                <th class="px-2 py-2">Descrição</th>
                                <th class="px-2 py-2">Dia</th>
                                <th class="px-2 py-2">Valor</th>
                                <th class="px-2 py-2">Categoria</th>
                                <th class="px-2 py-2 w-20 right-0"><button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2">Registrar</button></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="px-2  py-2">Gasolina Moto</td>
                                <td class="px-2  py-2">10</td>
                                <td class="px-2  py-2 text-red-600 font-semibold">27,88</td>
                                <td class="px-2  py-2">Combustível</td>
                                <td class="px-2  py-2">
                                <div class="w-20 flex">
                                    <div class="w-1/2">
                                        <button class="bg-blue-500 hover:bg-blue-700 rounded text-white pt-1 pb-2 px-2 w-auto h-auto">
                                            <FaEdit size={18} color="#FFF" />
                                        </button>
                                    </div>
                                    <div class="w-1/2 flex flex-row-reverse">
                                        <button class="bg-blue-500 hover:bg-blue-700 rounded text-white w-auto h-auto px-2">
                                            <FaTrashAlt size={18} color="#FFF" />
                                        </button>
                                    </div>
                                </div>
                                </td>
                            </tr>							
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>			
            
            
            <div class="md:w-1/3 p-2 md:p-0">				
                <div class="bg-white rounded-lg shadow">
                    <div class="bg-gray-300 border-b-2 border-gray-400 rounded-tl-lg rounded-tr-lg p-2">
                        <h5 class="font-bold uppercase text-gray-700 text-center">Estimativas</h5>
                    </div>
                    
                    <div class="">
                        <table class="table-auto w-full">
                            <thead class="bg-gray-300 text-gray-700 border-b-2 border-gray-400 text-left">
                            <tr>
                                <th class="px-2 py-2">Categoria</th>
                                <th class="px-2 py-2 text-right">Valor Estimado</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="px-2  py-2">Combustível</td>
                                <td class="px-2  py-2 text-right text-red-600 font-semibold">350,00</td>
                            </tr>							
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>			
        </div>
        <div class="pb-16"></div>     
        </div>   
    </div>
  );
}

  export default Home;