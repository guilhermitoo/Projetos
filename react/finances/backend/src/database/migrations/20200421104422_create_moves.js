
exports.up = function(knex) {
    return (
    knex.schema.createTable('moves',function(table){
        table.increments().primary();
        
        table.integer('month_id').notNullable();
        table.foreign('month_id').references('id').inTable('month');
        table.string('description').notNullable();
        table.integer('category').notNullable();
        table.foreign('category').references('id').inTable('categories');      
        table.integer('bill');
        table.foreign('bill').references('id').inTable('bills');  
        table.integer('resolution_day').notNullable();
        table.enu('payment_receive',['P','R']).notNullable(); // P = pagamento, R = recebimento
        table.decimal('value').notNullable();          
    })
    );
};

exports.down = function(knex) {
    return knex.schema.dropTable('moves');    
};
