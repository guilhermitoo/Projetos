import React from "react";
import {
    NavLink,
    HashRouter
  } from "react-router-dom";

import Header from "../Header";

function Cat() {
    return (
        <HashRouter>
            <div className="Cat">
                <div class="flex-1 bg-gray-300 h-screen">
                    <Header name="Cadastro de Categorias"/>
                    <div class="md:overflow-auto h-screen">

                    </div>
                </div>
            </div>
        </HashRouter>
    );    
};

export default Cat;