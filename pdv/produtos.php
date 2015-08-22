<?php
    require_once 'medoo.min.php';
 
    $database = new medoo();

    $id = $database->insert("produtos",[
        "descricao"=> (string) $_POST["descricao"],
        "unidade"=> (string) $_POST["unidade"],
        "preco"=> (float) $_POST["preco"]
    ]);    


include("index.html");
    
    