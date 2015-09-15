<?php
$usuario = $_POST["login"];
$senha = $_POST["senha"];

// conexão postgreSQL
require_once 'db.php';

// */Aqui veificamos se o usuario e senha digitados no formulário existem e estão corretos/*
$query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);			
$qregistro = sizeof($query);

if($qregistro<1){
   echo "Login ou senha errado(s)!!";
} 
else 
{
//   */Apos verificado ele grava o usuario e senha no vetor $_session[]/*   
   session_start();
   $_SESSION['nome_usuario']=$usuario;
   $_SESSION['senha_usuario']=$senha;
   header("Location: home.php");
}

?>