const connection = require('../database/connection');

module.exports = {
    async index(request,response) {
        const estimates = await connection('estimates').join('categories','estimates.category','categories.id')
            .select('estimates.*','categories.description');
    
        return response.json(estimates);
    },

    async estimateCategory(category) {
        // método busca o valor dos últimos 6 meses desta categoria e faz uma média.

        var qry = await connection.avg('avg_value').from(function () {
            this.sum('moves.value as avg_value').from('moves').where('moves.category',category).join('month','month.id','=','moves.month_id').groupBy('month.first_day').orderBy('month.first_day','desc').limit(6).as('tmp');
        });

        var value = qry[0].avg;

        if (!value) {
            value = 0
        }

        return value
    },

    async create(request,response) {
        const { category } = request.body;

        var { value = 0 } = request.body;

        if (value == 0) {
            value = await module.exports.estimateCategory(category);
        }

        var qry = await connection('estimates').where('category',category).select('id');        

        if (qry[0]){
            var id = qry[0].id;    

            await connection('estimates').where('category',category).update({value});
        }
        else {
            const [id] = await connection('estimates').insert({
                category,
                value
            }, "id");
        }

        return response.json({id});
    }, 

    
}