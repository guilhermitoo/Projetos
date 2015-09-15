<?php

require_once 'db.php';

if (isset($_GET['id'])){
	$id = $_GET['id'];
}
else{
	$id = '';
}

if ( empty($id) ){
	$query = $database->select('produtos',['id','descricao','unidade','preco']);
}
else{
	$query = $database->select('produtos',['id','descricao','unidade','preco'],['id'=>$id]);
}

$query = json_encode($query);

echo $query;