<?php
    require_once 'medoo.min.php';
 
    $database = new medoo();

    $id = $database->insert("clientes",[
        "nome"=> (string) $_POST["nome"],
        "cpf"=> (string) $_POST["cpf"],
        "credito"=> (float) $_POST["credito"]
    ]);    

<!-- retorna para a tela index.html -->
include("index.html");
    
    