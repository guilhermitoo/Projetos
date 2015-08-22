<?php
    // faz a conexão com o banco postgre
//      $conn = "host=localhost port=5432 user=postgres password=masterkey";
//      $conexao = pg_connect($conn);
    require "medoo.min.php";

    $database = new medoo([
        'database_type' => 'pgsql',
        'database_name' => 'pdv',
        'server' => 'localhost',
        'username' => 'postgres',
        'password' => 'masterkey',
        'charset' => 'utf8',
        'port' => 5432
    ]);   