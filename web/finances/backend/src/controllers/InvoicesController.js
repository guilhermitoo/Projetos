const connection = require('../database/connection');
const global = require('../global');

module.exports = {
    async index(request, response) {
        const invoices = await connection('invoices').select('*');
    
        return response.json(invoices);
    },

    async create(request, response){
        const {description,category,value,payment_receive,total_portion,date} = request.body;                        

        var id_list = new Array(total_portion);

        for (let index = 0; index < total_portion; index++) {
            var portion = index+1

            var ret = await global.getNextMonth(date,index);
            var due_day = ret[0];
            var month_id = ret[1];            

            const [id] = await connection('invoices').insert({
                description,
                category,
                value,
                due_day,
                payment_receive,
                portion,
                total_portion,
                month_id
            }, "id");

            id_list[index] = id;
        }

        return response.json({ "invoices": id_list });
    },

    async delete(request,response){
        const { id } = request.params;

        await connection('invoices')
            .where('id',id)
            .delete();

        return response.status(204).send();
    }
}