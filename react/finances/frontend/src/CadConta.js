import React, { Component } from "react";
import {
  Route,
  HashRouter
} from "react-router-dom"; 
import CadConta_list from "./CadConta_list";
import CadConta_crud from "./CadConta_crud";
import "./CadConta.css";

class CadConta extends Component {
  render() {
    return (
      <div className="CadConta">      
        <div class="flex-1 bg-gray-300 h-screen">
          <header class="py-4 grid grid-cols-6 border-b-2 border-gray-600">
            <h1 class="text-center col-start-2 col-end-6 font-bold md:text-2xl text-gray-600">Cadastro de Conta Fixa</h1>      
          </header>

          <HashRouter> 

            <div className="content">
                <Route path="/cad_conta/list" component={CadConta_list}/>
                <Route path="/cad_conta/crud" component={CadConta_crud}/>                    
            </div>     
          </HashRouter>
          </div>
      
      </div>
    );
  }
}
 
export default CadConta;