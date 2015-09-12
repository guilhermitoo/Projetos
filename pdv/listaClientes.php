<?php
// adiciona a extensão do medoo
	require_once 'db.php';
// faz o select e traz para a query
	$query = $database->select('clientes',['id','nome','cpf','credito']);
// retorna em um json
	echo json_encode($query);