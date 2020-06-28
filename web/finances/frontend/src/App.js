import React, {useState,useEffect} from 'react';
import './tailwind.generated.css';

import api from './services/api';

import Home from './Home';

function App() {
	const [_month,Set_month] = useState(-1);
	const [_year,Set_year] = useState(-1);
	const [previous_month,SetPreviousMonth] = useState("");
	const [actual_month,SetActualMonth] = useState("");
	const [next_month,SetNextMonth] = useState("");
	
	useEffect(()=>{
        if (_month === -1) {
            var date = new Date();
            Set_month(date.getMonth()+1);
            Set_year(date.getFullYear());
		}          
		
		localStorage.setItem("_month",_month);
		localStorage.setItem("_year",_year);
		
		var pm = _month-1;
		if (pm <= 0) { pm = 12 }
		var nm = _month+1;
		if (nm >=13 ) { nm = 1 }

		api.get("/month_name?month="+pm).then( response => {
			if (response.data) {
				SetPreviousMonth(response.data.name);
			}
		});

		api.get("/month_name?month="+_month).then( response => {
			if (response.data) {
				SetActualMonth(response.data.name);
			}
		});	
		
		api.get("/month_name?month="+nm).then( response => {
			if (response.data) {
				SetNextMonth(response.data.name);
			}
		});	
		
	},[_month,_year]);

    function nextMonth(e) {
        e.preventDefault();

        var nm = ((_month)%12)+1;

        if (nm === 1) {
            Set_year(_year+1);
        }
        Set_month(nm);
	}	
	
	function previousMonth(e) {
		e.preventDefault();

        var nm = _month-1;

        if (nm <= 0) {
			Set_year(_year-1);
			nm = 12;
        }
        Set_month(nm);
	}

    return (
    <div className="App">      
		<div class="flex-1 bg-gray-300">
			<header class="py-4 grid grid-cols-6 border-b-2 border-gray-600">
			<div class="px-4 flex">
				<button class="bg-blue-500 hover:bg-blue-700 rounded w-32 text-center font-bold text-white px-4" onClick={previousMonth}>
				{previous_month}                              
				</button>            
			</div>                      
			
			<h1 class="text-center col-start-2 col-end-6 font-bold md:text-2xl text-gray-600">{actual_month}/{_year}</h1>      
			
			<div class="flex flex-row-reverse px-4">
				<button class="bg-blue-500 hover:bg-blue-700 rounded w-32 text-center font-bold text-white px-4" onClick={nextMonth}>
				{next_month}
				</button>            
			</div>      

			</header>
			<Home />				
		</div>         
	</div>
  );
}

export default App;
