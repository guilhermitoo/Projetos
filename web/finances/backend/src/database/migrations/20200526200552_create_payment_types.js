
exports.up = function(knex) {
    return knex.schema.createTable('payment_types',function(table){
        table.increments().primary();
        
        table.string('description').notNullable();        
    }); 
};

exports.down = function(knex) {
    return knex.schema.dropTable('payment_types');  
};
