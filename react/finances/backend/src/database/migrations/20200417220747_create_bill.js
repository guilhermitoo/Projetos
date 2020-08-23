
exports.up = function(knex) {
    return knex.schema.createTable('bills',function(table){
        table.increments().primary();
        
        table.string('description').notNullable();
        table.integer('category').notNullable();
        table.foreign('category').references('id').inTable('categories');
        table.decimal('value').notNullable();
        table.integer('due_day').notNullable();
        table.enu('payment_receive',['P','R']).notNullable(); // P = pagamento, R = recebimento
        table.boolean('fixed_value').notNullable().defaultTo(false);
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('bills');  
};
