import React from 'react';
import { FaFileInvoice, FaWallet, FaChartArea, FaTasks } from 'react-icons/fa';
import './tailwind.generated.css';

import Home from './Home';

function App() {
 
  return (
    <div className="App">      
		<div class="flex flex-col md:flex-row">
	  
      	<nav class="bg-gray-800 h-16 fixed bottom-0 md:relative md:h-screen z-10 w-full md:w-48"> 
			<div class="hidden md:block">
			<h5 class="font-bold uppercase text-gray-100 text-center py-4 text-2xl border-b-2 border-gray-100">Finanças</h5>          
			</div>
		
			<div class="md:mt-12 md:w-48 md:fixed md:left-0 md:top-0 content-center md:content-start text-left justify-between md:pt-4">
				<ul class="list-reset flex flex-row md:flex-col py-0 md:py-3 px-1 md:px-2 text-center md:text-left">
					<li class="mr-3 flex-1">					
						<a href="#" class="block pt-2 md:py-3 pl-1 align-middle text-white no-underline hover:text-white border-b-2 border-gray-700 hover:border-pink-500 flex flex-col md:flex-row">
							<FaTasks size={20} color="#FFF" class="w-full md:w-auto md:pl-4"/>
							<span class="pb-1 pt-1 md:pl-4 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Geral</span>
						</a>
					</li>
					<li class="mr-3 flex-1">
						<a href="#" class="block pt-2 md:py-3 pl-1 align-middle text-white no-underline hover:text-white border-b-2 border-gray-700 hover:border-purple-500  flex flex-col md:flex-row">
							{/* <i class="fa fa-file-invoice-dollar pr-0 md:pr-3"></i> */}
							<FaFileInvoice size={20} color="#FFF" class="w-full md:w-auto md:pl-4"/>
							<span class="pb-1 pt-1 md:pl-4 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Contas fixas</span>
						</a>
					</li>
					<li class="mr-3 flex-1">
						<a href="#" class="block pt-2 md:py-3 pl-1 align-middle text-white no-underline border-b-2 border-gray-700 hover:border-blue-600  flex flex-col md:flex-row">
							{/* <i class="fas fa-wallet pr-0 md:pr-3"></i> */}
							<FaWallet size={20} color="#FFF" class="w-full md:w-auto md:pl-4"/>
							<span class="pb-1 pt-1 md:pl-4 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Gastos</span>
						</a>
					</li>
					<li class="mr-3 flex-1">
						<a href="#" class="block pt-2 md:py-3 pl-0 md:pl-1 align-middle text-white no-underline hover:text-white border-b-2 border-gray-700 hover:border-red-500  flex flex-col md:flex-row">
							{/* <i class="fa fa-chart-area pr-0 md:pr-3"></i> */}
							<FaChartArea size={20} color="#FFF" class="w-full md:w-auto md:pl-4"/>
							<span class="pb-1 pt-1 md:pl-4 md:pt-0 md:pb-0 text-xs md:text-base text-gray-100 block md:inline-block">Estimativas</span>
						</a>
					</li>
				</ul>
			</div>		
		</nav>   
	
		<div class="main-content flex-1 bg-gray-100">
			<header class="py-4 grid grid-cols-6 border-b-2 border-gray-600">
			<div class="px-4 flex">
				<button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-4">
				Março                              
				</button>            
			</div>                      
			
			<h1 class="text-center col-start-2 col-end-6 font-bold text-2xl text-gray-600">Abril/2020</h1>      
			
			<div class="flex flex-row-reverse px-4">
				<button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-4">
				Maio                              
				</button>            
			</div>      

			</header>
			<Home />				
		</div> 
	</div>          
	</div>
  );
}

export default App;
