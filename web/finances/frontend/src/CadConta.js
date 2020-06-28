import React, { Component } from "react";
import {
  Route,
  NavLink,
  HashRouter
} from "react-router-dom"; 
import CadConta_list from "./CadConta_list";
import CadConta_crud from "./CadConta_crud";
import "./CadConta.css";

class CadConta extends Component {
  render() {
    return (
      <div className="CadConta">
        <div class="flex-1 bg-gray-300">
          <header class="py-4 grid grid-cols-6 border-b-2 border-gray-600">
          <h1 class="text-center col-start-2 col-end-6 font-bold md:text-2xl text-gray-600">Cadastro de Conta Fixa</h1>      
          </header>
          <HashRouter>
            <div class="overflow-auto h-auto pb-24 md:pb-5 text-sm md:text-base p-2">
              <ul className="header" class="flex border-b border-gray-400">
                <li class="tab">
                  <NavLink exact to="/cad_conta"><text class="px-16">Listagem</text></NavLink>
                </li> 
                <li class="tab">
                  <NavLink to="/cad_conta/crud"><text class="px-16">Cadastro</text></NavLink>
                </li>
              </ul>
              <div className="content" class="bg-white h-screen border-gray-400 border-l border-r border-b">
                <Route exact path="/cad_conta" component={CadConta_list}/>
                <Route path="/cad_conta/crud" component={CadConta_crud}/>
              </div>
            </div>             
          </HashRouter>
        </div>
      </div>
    );
  }
}
 
export default CadConta;