
exports.up = function(knex) {
    return knex.schema.createTable('month',function(table){
        table.integer('id').primary();        
        
        table.string('name').notNullable();
        table.integer('month_number').notNullable();
        table.integer('year').notNullable();
        table.date('first_day');

        table.unique(['month_number', 'year']);
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('month');  
};
