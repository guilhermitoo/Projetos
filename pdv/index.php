<?php

define('RETORNO', 'echo');

function retorno($data){
	if ( RETORNO == 'echo'){
		echo $data;
	}else{
		return $data;
	}
}

if ( !isset($_SESSION['user']) ){
	header('Location: login.html');
}

if ( !isset($_GET) ){
	header('..pagina de erro');
}

require_once 'produto.class.php';
require_once 'pedido.class.php';
require_once 'cliente.class.php';

if ( !class_exists($_GET['c'])){
	header('...pagina erro (nao existe classe)');
}
if ( !method_exists($_GET['a'])){
	header('...pagina erro (nao existe metodo)');
}

$app = new $_GET['c']();	
$app->$_GET['a'];
