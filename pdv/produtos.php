<?php
    require_once 'medoo.min.php';
 
    $database = new medoo();
    
    if ( isset($_POST) ){
        
        $descricao = $_POST['descricao'];
        $unidade = $_POST['unidade'];
        $preco = str_replace(',','.', (string)(float)$_POST['preco']);
        
        $id = $database->insert("produtos",[
            "descricao"=> $descricao,
            "unidade"=> $unidade,
            "preco"=> $preco
        ]);    
    }
    
include("index.html");
    
    
