
exports.up = function(knex) {
    return (
        knex.schema.alterTable('bills', function(table) {
            table.integer('first_month').notNullable().defaultTo(1);
            table.integer('last_month');
            table.foreign('first_month').references('id').inTable('month');
            table.foreign('last_month').references('id').inTable('month');
        })  );
};

exports.down = function(knex) {
    return (
        knex.schema.alterTable('bills', function(table) {
            table.dropColumn('first_month');
            table.dropColumn('last_month');
            table.dropForeign('first_month');
            table.dropForeign('last_month');
        })  );
};
