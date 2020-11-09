const connection = require('./database/connection');

module.exports = {
    getMonthName(month) {
        var names = [
                    "Janeiro",
                    "Fevereiro",
                    "Março",
                    "Abril",
                    "Maio",
                    "Junho",
                    "Julho",
                    "Agosto",
                    "Setembro",
                    "Outubro",
                    "Novembro",
                    "Dezembro"
                    ];

        return names[month-1];
    },

    async getMonthID_(month,year) {
        var dt = new Date(year,month-1,1);
        var rt = await module.exports.getMonthID(dt)

        return rt[1];
    },

    async getMonthID(date) {
        try {
            var dt = new Date(date);

            var day = dt.getDate();
            var month_number = dt.getMonth()+1; // Soma 1 pois o método retorna indexado em 0.
            var year = dt.getFullYear();               
            var name = this.getMonthName(month_number);        
    
            const month = await connection('month').where('month_number',month_number).andWhere('year',year).select('id').first();        

            // verificar se o mês existe. Caso não exista, cadastrar o mês
            if (month) {
                var month_id = month.id;
            }
            else {
                var first_day = year+'-'+month_number+'-'+'01';
                var id = String(month_number)+year;

                var [month_id] = await connection('month').insert({
                    id,
                    name,
                    month_number,
                    year,
                    first_day
                },"id");            
            };

            var arr = new Array(2)
            arr[0] = day;
            arr[1] = month_id;
            return arr;
        }
        catch (e) {
            return e;
        }
    },

    async getNextMonth(date,index) {
        // se for índice 0, pega o ID do mês informado
        // senão, incrementa o mês/ano com o valor de index
        if (index==0) {
            return module.exports.getMonthID(date);
        }
        else {
            var dt = new Date(date);                            

            if (((dt.getMonth()+1) == 1) && (dt.getDate>28)) {
                var dday = 28;
            } else if (dt.getDate>30) {
                var dday = 30;
            } else { 
                var dday = dt.getDate();
            }

            var mmonth = (((dt.getMonth()) + (index)) % 12);
            var years = Math.trunc((dt.getMonth()+index)/12);            

            var c_date = new Date(dt.getFullYear()+years, mmonth, dday);            
    
            var ret = module.exports.getMonthID(c_date);

            return ret;
        }        
    }
}