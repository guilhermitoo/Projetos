
exports.up = function(knex) {
    return knex.schema.createTable('categories',function(table){
        table.increments().primary();
        
        table.string('description').notNullable();
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('categories');  
};
