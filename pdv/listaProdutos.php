<?php
	require_once 'medoo.min.php';

	$database = new medoo();

  if (isset($_GET['id'])){
	  $query = $database->select('produtos',['id','descricao','unidade','preco'],['id'=>$_GET['id']]);
	}else{
	  $query = $database->select('produtos',['id','descricao','unidade','preco']);
	}

	echo json_encode($query);

	