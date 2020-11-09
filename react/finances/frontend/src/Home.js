import React from 'react';
import { FaTrashAlt, FaEdit } from 'react-icons/fa';
import './tailwind.generated.css';

import Pagar from './Pagar';
import Receber from './Receber';

function Home() {

  return (
    <div className="Home">
        <div class="overflow-auto h-screen pb-24 md:pb-5 text-sm md:text-base">           

            <Pagar />
            <Receber />

            <div class="md:flex md:p-2">
                <div class="md:w-2/3 md:pr-2 p-2 md:p-0">				
                    <div class="bg-white rounded-lg shadow">
                        <div class="bg-gray-400 border-b-2 border-gray-500 rounded-tl-lg rounded-tr-lg p-2">
                            <h5 class="font-bold uppercase text-gray-700 text-center">Movimentações</h5>
                        </div>
                        
                        <div class="">
                            <table class="table-auto w-full">
                                <thead class="bg-gray-400 text-gray-700 border-b-2 border-gray-400 text-left">
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
                        <div class="bg-gray-400 border-b-2 border-gray-500 rounded-tl-lg rounded-tr-lg p-2">
                            <h5 class="font-bold uppercase text-gray-700 text-center">Estimativas</h5>
                        </div>
                        
                        <div class="">
                            <table class="table-auto w-full">
                                <thead class="bg-gray-400 text-gray-700 border-b-2 border-gray-500 text-left">
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
            <div class="pb-24"></div>     
        </div>   
    </div>
  );
}

  export default Home;