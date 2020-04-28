const connection = require('../database/connection');

module.exports = {
    async index(request, response) {
        const bills = await connection('bills').select('*');
    
        return response.json(bills);
    },

    async create(request, response){
        const {description,category,value,due_day,payment_receive,fixed_value} = request.body;        

        const [id] = await connection('bills').insert({
            description,
            category,
            value,
            due_day,
            payment_receive,
            fixed_value           
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