<?php
    require_once 'db.php';

	$nome = $_POST["nome"];
	$cpf = $_POST["cpf"];
	$credito = str_replace(',','.', $_POST["credito"]);

    $id = $database->insert("clientes",[
        "nome"=> $nome,
        "cpf"=> $cpf,
        "credito"=> $credito
    ]);    

header("location: index.php");    