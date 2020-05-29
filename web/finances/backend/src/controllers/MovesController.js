const connection = require('../database/connection');
const global = require('../global');

module.exports = {
   // get para listar o histórico de algum mês específico.
   
   async getMonthID(month,year) {
      const _month = await connection('month').where('month_number',month).andWhere('year',year).select('id').first();

      return _month;
   },

   async index(request, response) {
      const { month, year } = request.body;

      const _month = await module.exports.getMonthID(month,year);

      if (_month){
         var month_id = _month.id;
      } else {
         return response.json({});
      }

      const moves = await connection('moves').where('month_id',month_id).select('*');

      return response.json(moves);
   },

   async open(request, response) {
      const { month , year , type } = request.query;

      const _month = await module.exports.getMonthID(month,year);

      if (_month){
         var month_id = _month.id;
      } else {
         return response.json({});
      }
      
      const bills = await connection('bills').select('bills.*','categories.description as cat_description').
         whereNotIn('bills.id',connection('moves').select('bill').where('month_id',month_id)).
         join('categories','bills.category','categories.id').
         andWhere('bills.payment_receive',type.toUpperCase());
         
      return response.json(bills);
   },

   async paid(request, response) {
      const { month , year , type } = request.query;

      const _month = await module.exports.getMonthID(month,year);

      if (_month){
         var month_id = _month.id;
      } else {
         return response.json({});
      }

      const moves = await connection('moves').where('month_id',month_id).
         andWhere('payment_receive',type.toUpperCase()).andWhereNot('bill',null).select('moves.*',
                  'categories.description as cat_description',
                  'payment_types.description as payment_type_description').
                  join('categories','moves.category','categories.id').
                  join('payment_types','moves.payment_type','payment_types.id');

      return response.json(moves);
   },

   async create(request, response) {
      const {date, description, category, payment_receive, value} = request.body;
      
      var dt = new Date(date);

      var resolution_day = dt.getDate();
      var month_number = dt.getMonth()+1; // Soma 1 pois o método retorna indexado em 0.
      var year = dt.getFullYear();
      var name = global.getMonthName(month_number);

      const month = await connection('month').where('month_number',month_number).andWhere('year',year).select('id').first();      

      // verificar se o mês existe. Caso não exista, cadastrar o mês
      if (month) {
         var month_id = month.id;
      }
      else {
         var first_day = year+'-'+month_number+'-'+'01';

         var [month_id] = await connection('month').insert({
            name,
            month_number,
            year,
            first_day
         },"id");
      };

      const [id] = await connection('moves').insert({
         month_id,
         description,
         category,
         resolution_day,
         payment_receive,
         value
      }, "id");

      return response.json({id});
   }
}