const connection = require('../database/connection');

module.exports = {
    async index(request, response) {
        const categories = await connection('categories').select('*');
    
        return response.json(categories);
    },

    async create(request, response){
        const {description} = request.body;        

        const [id] = await connection('categories').insert({
            description            
        }, "id");

        return response.json({ id });
    }
}