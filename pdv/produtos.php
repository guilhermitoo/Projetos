<?php    	

	require_once 'db.php';

	if ( isset($_POST) ){        		
		$descricao = $_POST['descricao'];
		$unidade = $_POST['unidade'];	
		$preco = str_replace(',','.', $_POST['preco']);

		$id = $database->insert("produtos",[
				"descricao"=> $descricao,
				"unidade"=> $unidade,
				"preco"=> $preco
			]);	
	}   

include("index.php");
    
    
