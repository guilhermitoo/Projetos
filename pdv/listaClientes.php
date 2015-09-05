<?php
// adiciona a extensão do medoo
	require_once 'medoo.min.php';
// inicia a conexão do banco
	$database = new medoo();
// faz o select e traz para a query
	$query = $database->select('clientes',['id','nome','cpf','credito']);
// retorna em um json
	echo json_encode($query);