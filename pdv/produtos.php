<?php
    require_once 'db.php';

	require_once 'index.php';

	require_once 'produto.class.php';

	if ( isset($_POST) ){        		
		$descricao = $_POST['descricao'];
		$unidade = $_POST['unidade'];	
		$preco = str_replace(',','.', $_POST['preco']);

		$p = new Produto();
		$p->setDescricao($descricao);
		$p->setUnidade($unidade);
		$p->setPreco($preco);
		
		$p->incluir();
	}   

//include("index.html");
    
    
