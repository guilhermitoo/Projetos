import React from 'react';
import './tailwind.generated.css';

function App() {
 
  return (
    <div className="App" class="grid md:grid-cols-7 lg:grid-cols-10 xl:grid-cols-12  h-screen">      
      <nav class="bg-gray-800 md:col-span-2 lg:col-span-2 xl:col-span-2">
        <div>
          <h1 class="text-white pl-4 py-4 text-2xl">Controle Finanças</h1>
          <hr />
        </div>
        <ul class="md:px-6 lg:px-8 xl:px-10 pt-4">
          <li class="mr-3 py-2 flex-1">
              <a href="#" class="hover:font-bold">  
                  <span class="pb-1 text-white block text-left text-xl">Contas</span>
              </a>
          </li>
          <li class="mr-3 py-2 flex-1">
              <a href="#" class="hover:font-bold">
                  <span class="pb-1 text-white block text-left text-xl">Gastos</span>
              </a>
          </li>      
          <li class="mr-3 py-2 flex-1">
              <a href="#" class="hover:font-bold">
                  <span class="pb-1 text-white block text-left text-xl">Estimativas</span>
              </a>
          </li>                 
        </ul>
      </nav>   

      <div class="bg-white md:col-span-5 lg:col-span-8 xl:col-span-10">
        <div class="py-4 grid grid-cols-6">
          <div class="px-4 flex">
            <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-4">
              Março                              
            </button>            
          </div>                      
          
          <h1 class="text-center col-start-2 col-end-6 font-bold text-2xl text-gray-800">Abril/2020</h1>      
          
          <div class="flex flex-row-reverse px-4">
            <button class="bg-blue-500 hover:bg-blue-700 rounded w-auto text-center font-bold text-white px-4">
              Maio                              
            </button>            
          </div>      

        </div>
        <hr />        
      </div>     
      

    </div>
  );
}

export default App;
