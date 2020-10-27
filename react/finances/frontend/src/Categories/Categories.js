import React from "react";
import {
    NavLink,
    HashRouter
  } from "react-router-dom";

import Header from "../Header";

function Categories() {
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
                    </div>
                </div>
            </div>
        </HashRouter>
    );    
};

export default Categories;