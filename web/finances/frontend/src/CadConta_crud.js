import React, { Component } from "react";
 
function CadConta_crud() {
  
    return (
      <div className="CadConta_crud">
        <form class="flex p-2 flex-col">          
          <text class="">Descrição</text>  
          <input class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Categoria</text>
          <input class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Valor</text>
          <input class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Dia de vencimento</text>
          <input class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
          <text class="">Tipo</text>
          <input class="bg-white focus:outline-none focus:shadow-outline border border-gray-300 rounded-lg py-2 px-4 block w-full appearance-none leading-normal"></input>
        </form>
      </div>
    );
  
}

export default CadConta_crud;
