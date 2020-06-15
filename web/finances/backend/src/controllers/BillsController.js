const connection = require('../database/connection');
const global = require('../global');

module.exports = {
    async index(request, response) {
        const bills = await connection('bills').select('*');
    
        return response.json(bills);
    },

    async create(request, response){
        const {description,category,value,due_day,payment_receive,fixed_value,month,year} = request.body;        

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