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
    },

    async delete(request,response){
        const { id } = request.params;

        var cat = [];
        cat = await connection('categories').select('id').where('id',id);
        if (cat.length <= 0) {
            return response.status(404).send();
        }

        await connection('categories')
            .where('id',id)
            .delete();

        return response.status(204).send();
    },
}