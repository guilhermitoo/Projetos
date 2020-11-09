const connection = require('../database/connection');
const knex = require('knex');
const global = require('../global');

module.exports = {
   // get para listar o histórico de algum mês específico.
   
   async findMonthID(month,year) {
      const _month = await connection('month').where('month_number',month).andWhere('year',year).select('id').first();

      return _month;
   },

   async index(request, response) {
      const { month, year } = request.body;

      var month_id = await global.getMonthID_(month,year);

      const moves = await connection('moves').where('month_id',month_id).select('*');

      return response.json(moves);
   },

   async open(request, response) {
      const { month , year , type } = request.query;

      var month_id = await global.getMonthID_(month,year);

      var resp = { bills : [] }

      resp.bills = await connection('bills').select('bills.description',
         'null as invoice_id', 'bills.id as bill_id',
         'bills.category','bills.value','bills.due_day','bills.payment_receive',
         'categories.description as cat_description').
         whereNotIn('bills.id',connection('moves').select('bill').where('month_id',month_id).andWhereNot('bill',null)).
         join('categories','bills.category','categories.id').
         join('month as m','bills.first_month','m.id').
         leftJoin('month as m2','bills.last_month','m2.id').
         andWhere('bills.payment_receive',type.toUpperCase()). // verifica o tipo se é Pagar ou Receber
         andWhereRaw('( ((m.month_number <= ? ) and (m.year <= ?)) or (m.year < ?))',[month,year,year]). // verifica se está dentro da data incial pra exibir
         andWhereRaw('((bills.last_month is null) or ((m2.month_number >= ?) and (m2.year >= ?)))',[month,year]). // verifica se está dentro da data final pra exibir
         unionAll(
            connection('invoices').select("invoices.description || ' (' || invoices.portion || '/' || invoices.total_portion || ')'",
            'invoices.id as invoice_id','null as bill_id',
            'invoices.category','invoices.value','invoices.due_day','invoices.payment_receive',
            'categories.description as cat_description').
            whereNotIn('invoices.id',connection('moves').select('invoice').where('month_id',month_id).andWhereNot('invoice',null)).
            join('categories','invoices.category','categories.id').
            andWhere('invoices.payment_receive',type.toUpperCase()).
            andWhere('month_id',month_id)
         );

         // ajustar depois
         // "invoices.description || '(' || invoices.portion || '/' || invoices.total_portion || ')'"
         
      for (let index = 0; index < resp.bills.length; index++) {
         const element = resp.bills[index];

         resp.bills[index].id = index+1;
      }

      return response.json(resp);
   },

   async paid(request, response) {
      const { month , year , type } = request.query;

      var month_id = await global.getMonthID_(month,year);

      var resp = { bills : [] }
   
      resp.bills = await connection('moves').select('moves.*',
      'categories.description as cat_description',
      'payment_types.description as payment_type_description').
      join('categories','moves.category','categories.id').
      join('payment_types','moves.payment_type','payment_types.id').
         where('moves.month_id',month_id).
         andWhere('moves.payment_receive',type.toUpperCase()).andWhereRaw('((bill is not null) or (invoice is not null))');

      for (let index = 0; index < resp.bills.length; index++) {
         const element = resp.bills[index];

         resp.bills[index].id = index+1;
      }

      return response.json(resp);
   },

   async create(request, response) {
      const {date, description, category, payment_receive, value, bill, payment_type, invoice } = request.body;
      
      var month = await global.getMonthID(date);
      var resolution_day = month[0];
      var month_id = month[1];            

      const [id] = await connection('moves').insert({
         month_id,
         description,
         category,
         resolution_day,
         payment_receive,
         value, 
         bill, 
         payment_type, 
         invoice
      }, "id");

      return response.json({id});
   }
}