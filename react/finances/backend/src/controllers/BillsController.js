const connection = require('../database/connection');
const global = require('../global');

module.exports = {
    async index(request, response) {
        //const bills = await connection('bills').select('*');

        const bills = await connection('bills').select(
        "bills.id",
        "bills.description",
        "categories.description as cat_description",
        "mf.month_number || '/' || mf.year as first_date",
        "ml.month_number || '/' || ml.year as last_date",
        "bills.value",
        "bills.due_day").
        join('month as mf','bills.first_month','mf.id').
        leftJoin('month as ml','bills.last_month','ml.id').
        join('categories','bills.category','categories.id');
    
        return response.json(bills);
    },

    async create(request, response){
        const {description,category,value,due_day,payment_receive,fixed_value,month,year} = request.body;        

        //if ( description == "" ) { }

        var first_month = await global.getMonthID_(month,year);

        const [id] = await connection('bills').insert({
            description,
            category,
            value,
            due_day,
            payment_receive,
            fixed_value,
            first_month
        }, "id");

        return response.json({ id });
    },

    async delete(request,response){
        const { id } = request.params;

        var bill = [];
        bill = await connection('bills').select('id').where('id',id);
        if (bill.length <= 0) {
            return response.status(404).send();
        }

        var mov = [];
        mov = await connection('moves').select('id').where('bill',id);        
        if (mov.length > 0) {
            return response.status(200).json({erros:[{mensagem:'Não é possível excluir uma conta com movimentações. Neste caso apenas é possível finalizar a conta.'}]});
        }

        await connection('bills')
            .where('id',id)
            .delete();

        return response.status(204).send();
    },

    async close(request,response){
        const {id,month,year} = request.body;

        // verifica se a conta existe
        var bill = [];
        bill = await connection('bills').select('id').where('id',id);
        if (bill.length <= 0) {
            return response.status(402).json({error:"Conta não encontrada."});
        }

        // verifica se a conta já está fechada
        bill = [];
        bill = await connection('bills').select('id').where('id',id).whereNull('last_month');
        if (bill.length <= 0) {
            return response.status(402).json({error:"Conta já está finalizada."});
        }

        // verifica se a data para fechamento é maior ou igual que a data da última movimentação
        var mov = [];
        var mt = [];
        var last_month_id = await global.getMonthID_(month,year);
        mt = await connection('month').select('first_day').where('id',last_month_id);               
        mov = await connection('moves').join('month as m','moves.month_id','m.id').select('moves.id','m.first_day')
            .where('moves.bill',3)
            .orderBy('m.first_day','desc')
            .limit(1);
        if (mov.length > 0) {                                      
            if (mov[0].first_day > mt[0].first_day) {
                return response.status(402).json({error:"O mês para finalização deve ser maior ou igual ao mês da última movimentação."});   
            }
        }
        
        // verifica se a data para fechamento é maior ou igual que a data inicial da conta
        bill = [];
        bill = await connection('bills')
            .join('month as m','bills.first_month','m.id').select('bills.id','m.first_day')
            .where('bills.id',id);
        if (mt[0].first_day < bill[0].first_day) {
            return response.status(402).json({error:"O mês para finalização deve ser maior ou igual ao mês da abertura da conta."});    
        }
        
        await connection('bills')
            .where("id",id)
            .update({last_month : last_month_id});

        return response.status(204).send();        
    }
}