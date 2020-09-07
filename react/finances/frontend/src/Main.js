import React, { Component } from "react";
import { FaFileInvoice, FaWallet, FaChartArea, FaTasks } from 'react-icons/fa';
import './tailwind.generated.css';
import {
    Route,
    NavLink,
    HashRouter
  } from "react-router-dom";
import App from "./App";
import CadConta from "./CadConta";
import "./Main.css";
 
class Main extends Component {
  render() {
    return (
        <HashRouter>
            <div class="">
                <div class="flex flex-col md:flex-row">                        
                    <div class="h-16 fixed bottom-0 md:relative md:h-screen z-10 w-full md:w-48 bg-gray-800"> 
                        <div class="hidden md:block">
                        <h5 class="font-bold uppercase text-gray-100 text-center py-4 text-2xl border-b-2 border-gray-300">Finanças</h5>          
                        </div>
                        {/* MENU DESKTOP */} 
                        <div class="hidden md:block">
                            <ul className="header" class="">
                                <li class="hover:bg-gray-900">					                                                                                                                                                
                                    <NavLink exact to="/" activeClassName="selected">                                            
                                    <div class="align-middle flex flex-row py-4">                                        
                                        <FaTasks size={20} color="#FFF" class="w-auto pl-4"/>
                                        <text class="pl-4 text-lg text-gray-100">Geral</text>                                    
                                    </div>                                            
                                    </NavLink>                                        
                                </li>
                                <li class="hover:bg-gray-900">
                                    <NavLink to="/cad_conta/list" activeClassName="selected">
                                    <div class="align-middle flex flex-row py-4">
                                        <FaFileInvoice size={20} color="#FFF" class="w-auto md:pl-4"/>
                                        <text class="pl-4 text-lg text-gray-100">Conta fixa</text>                                        
                                    </div>
                                    </NavLink>
                                </li>
                                <li class="hover:bg-gray-900">
                                    <NavLink to="/cad_fatura" activeClassName="selected">
                                    <div class="align-middle flex flex-row py-4">
                                        <FaFileInvoice size={20} color="#FFF" class="w-auto md:pl-4"/>
                                        <text class="pl-4 text-lg text-gray-100">Fatura</text>                                        
                                    </div>
                                    </NavLink>
                                </li> 
                                <li class="hover:bg-gray-900">
                                    <NavLink to="/estimate" activeClassName="selected">
                                    <div class="align-middle flex flex-row py-4">
                                        <FaFileInvoice size={20} color="#FFF" class="w-auto md:pl-4"/>
                                        <text class="pl-4 text-lg text-gray-100">Estimativas</text>                                        
                                    </div>
                                    </NavLink>
                                </li>                               
                                
                            </ul>                        
                        </div>

                        {/* MENU MOBILE */}
                        <div class="block md:hidden md:mt-12 md:w-48 md:fixed md:left-0 md:top-0 content-center md:content-start text-left justify-between md:pt-4">
                            <ul className="header" class="list-reset flex flex-row md:flex-col py-0 md:py-3 px-1 md:px-2 text-center md:text-left">
                                <li class="mr-3 flex-1 pl-3">					                                                                                                                                                
                                    <NavLink exact to="/"  class="">                                            
                                    <div class="block pt-2 md:py-3 pl-1 align-middle border-b-2 border-gray-700 hover:border-pink-500 text-white no-underline flex flex-col md:flex-row md:w-32">                                        
                                        <FaTasks size={20} color="#FFF" class="w-full md:w-auto md:pl-2"/>
                                        <text class="pb-1 pt-1 md:pl-2 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Geral</text>                                    
                                    </div>                                            
                                    </NavLink>                                        
                                </li>
                                <li class="mr-3 flex-1 pl-3">
                                    <NavLink to="/cad_conta" class="" >
                                    <div class="block pt-2 md:py-3 pl-1 text-white border-b-2 border-gray-700 hover:border-purple-500 no-underline md:py-2 align-middle flex flex-col md:flex-row md:w-32">
                                        <FaFileInvoice size={20} color="#FFF" class="w-full md:w-auto md:pl-2"/>
                                        <text class="pb-1 pt-1 md:pl-2 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Conta fixa</text>                                        
                                    </div>
                                    </NavLink>
                                </li>
                                <li class="mr-3 flex-1 pl-3">
                                    <NavLink to="/cad_fatura" class="" >
                                    <div class="block pt-2 md:py-3 pl-1 align-middle text-white no-underline border-b-2 border-gray-700 hover:border-blue-600  flex flex-col md:flex-row md:w-32">
                                        {/* <i class="fas fa-wallet pr-0 md:pr-3"></i> */}
                                        <FaWallet size={20} color="#FFF" class="w-full md:w-auto md:pl-2"/>
                                        <text class="pb-1 pt-1 md:pl-2 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Fatura</text>
                                    </div>
                                    </NavLink>
                                </li>
                                <li class="mr-3 flex-1 pl-3">
                                    <NavLink to="/estimate" class="" >
                                    <div class="block pt-2 md:py-3 pl-0 md:pl-1 align-middle text-white no-underline border-b-2 border-gray-700 hover:border-red-500  flex flex-col md:flex-row md:w-32">
                                        {/* <i class="fa fa-chart-area pr-0 md:pr-3"></i> */}
                                        <FaChartArea size={20} color="#FFF" class="w-full md:w-auto md:pl-2"/>
                                        <text class="pb-1 pt-1 md:pl-2 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Estimativas</text>
                                    </div>
                                    </NavLink>
                                </li>
                            </ul>                        
                        </div>                        		                
                    </div>   
                    <div className="content" class="main-content md:w-screen">
                        <Route exact path="/" component={App}/>
                        <Route path="/cad_conta/" component={CadConta}/>                    
                    </div>                                
                </div>
            </div>
        </HashRouter>            
    );
  }
}
 
export default Main;