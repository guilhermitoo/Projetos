<?php

require_once 'db.php';

if ( isset($_POST) ){	
	// obtem os parâmetros do post
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	// faz a busca do usuário
	$query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);		
	
	$user = json_encode($query);	
	
	if ( ! empty($query) ){		
		$_SESSION['usuario'] = $usuario;		
		$_SESSION['senha'] = $senha;				
	}
	else{		
		session_destroy();		
		unset($_SESSION['usuario']);
		unset($_SESSION['senha']);				
	}
		
header("location: index.php");
	
//	$query = json_encode($query);	
//	retorno($query);
}