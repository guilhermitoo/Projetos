<?php
	require_once 'db.php';

  	if (isset($_GET['id'])){
	  $query = $database->select('produtos',['id','descricao','unidade','preco'],['id'=>$_GET['id']]);
	}else{
	  $query = $database->select('produtos',['id','descricao','unidade','preco']);
	}

	$query = json_encode($query);
	
	echo $query;