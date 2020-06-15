
exports.up = function(knex) {
    return knex.schema.createTable('invoices',function(table){
        table.increments().primary();
        
        table.string('description').notNullable();
        table.integer('category').notNullable();
        table.foreign('category').references('id').inTable('categories');
        table.decimal('value').notNullable();
        table.integer('due_day').notNullable();
        table.enu('payment_receive',['P','R']).notNullable(); // P = pagamento, R = recebimento
        table.integer('portion').notNullable();
        table.integer('total_portion').notNullable();
        table.integer('month_id').notNullable();
        table.foreign('month_id').references('id').inTable('month');        
    });
};

exports.down = function(knex) {
    return knex.schema.dropTable('invoices');    
};
