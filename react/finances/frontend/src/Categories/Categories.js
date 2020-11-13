import React, { useEffect,useState } from "react";
import api from '../services/api';
import {
    NavLink,
    HashRouter
  } from "react-router-dom";

import Header from "../Header";

function Categories() {

    const [categories,SetCategories] = useState([]);

    useEffect(()=>{      
        api.get('/categories',{}).then(response => {
            if (Array.isArray(response.data)) {
                SetCategories(response.data);
            }
        })
    },[]);  

    async function handleDelete(id) {
        if(id==null) {
        return;
        }
        try {
            if (window.confirm('Confirma exclusão?')) {
            await api.delete(`/category/${id}`,{}).then(response => {
                if (response.status === 200) {
                alert(response.data.erros[0].mensagem);
                } else {
                SetCategories(categories.filter(categories => categories.id !== id));                  
                }                      
            });          
            }        
        } catch (err) {
            alert('Erro ao excluir categoria, tente novamente.');
        };
    };

    return (
        <HashRouter>
            <div className="Categories">
                <div class="flex-1 bg-gray-300 h-screen">
                    <Header name="Cadastro de Categorias"/>
                        <div class="md:overflow-auto h-screen">
                            <div class="pt-2 px-2">
                                <NavLink to="/category/" class="" >
                                <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-4 py-2">Nova Categoria</button>                                
                                </NavLink>
                            </div> 
                            <div class="overflow-auto flex flex-col bg-white h-64 md:h-auto text-sm md:text-base rounded-lg m-2 shadow" >
                            <table class="w-full bg-white table-auto">
                                <thead class="text-left bg-gray-700 border-b-2 border-gray-900">
                                    <tr>
                                    <th class="px-2 py-2 text-white">ID</th>
                                    <th class="px-2 py-2 text-white">Descrição da Categoria</th>
                                    <th class="px-2 py-2 right-0 w-8"></th>
                                    </tr>
                                </thead>
                                <tbody class="">
                                    
                                    {categories.map(c => (
                                        <tr key={c.id} class="">
                                            <td class="px-2 py-2">{c.id}</td>
                                            <td class="px-2 py-2">{c.description}</td>
                                            <td class="px-2 py-2 right-0 w-8">
                                                <div class="">                                            
                                                    <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-2" onClick={() => handleDelete(c.id)}>Excluir</button>                              
                                                </div>                             
                                            </td>
                                        </tr>                            
                                    ))}                                                
                                </tbody>                                                                            
                            </table>                      
                            </div>
                        <div class="md:pb-24"></div>                         
                    </div>                                          
                </div>
            </div>
        </HashRouter>
    );    
};

export default Categories;