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

        await connection('bills')
            .where('id',id)
            .delete();

        return response.status(204).send();
    }
}