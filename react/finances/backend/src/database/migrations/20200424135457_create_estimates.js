
exports.up = function(knex) {
    return knex.schema.createTable('estimates',function(table){
        table.increments().primary();
                
        table.integer('category').notNullable();
        table.foreign('category').references('id').inTable('categories');        
        table.decimal('value').notNullable();

        table.unique('category');
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('estimates');     
};
