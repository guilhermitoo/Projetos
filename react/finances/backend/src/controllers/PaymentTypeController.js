const connection = require('../database/connection');

module.exports = {
    async index(request, response) {
        const payment_types = await connection('payment_types').select('*');
    
        return response.json(payment_types);
    },

    async create(request, response){
        const {description} = request.body;        

        const [id] = await connection('payment_types').insert({
            description            
        }, "id");

        return response.json({ id });
    }
}