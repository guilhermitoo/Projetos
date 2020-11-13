import React, { useState } from "react";
import api from '../services/api';
import {NavLink, useHistory} from "react-router-dom"; 

import Header from "../Header";

function Cat() {   
    const [description, SetDescription] = useState('');

    const history = useHistory();
  
    async function handleNewCat(e) {
      e.preventDefault();
      
      const data= {
        description
      };
      
      try {
        await api.post('category', data, {});
        
        history.push('/categories');
      } catch(err){
          alert('Erro ao cadastrar categoria, tente novamente.');
      }
    };

    return (        
        <div className="Cat">
            <div class="flex-1 bg-gray-300 h-screen">
                <Header name="Cadastro de Categorias"/>
                <div class="md:overflow-auto h-screen">
                    <form onSubmit={handleNewCat} class="flex p-2 flex-col">                                      
                        <text class="">Descrição</text>  
                        <input value={description} onChange={e => SetDescription(e.target.value)}
                        class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
                        
                        <div class="pt-4 flex flex-row">                        
                        <button type="submit" class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white py-2 px-4">Gravar Registro</button>          
                        <NavLink to="/categories" class="" >                      
                            <div class="px-2">
                            <button class="bg-red-500 hover:bg-red-700 rounded w-auto text-center font-bold text-white py-2 px-4">Cancelar</button> 
                            </div>
                        </NavLink>
                        </div>                    

                    </form>
                </div>
            </div>
        </div>
    );    
};

export default Cat;