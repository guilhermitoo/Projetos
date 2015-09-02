<?php
	require_once 'medoo.min.php';

	$database = new medoo();

	$query = $database->select('produtos',['id','descricao','unidade','preco']);

	echo json_encode($query);

	