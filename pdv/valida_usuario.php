<?php

//*/Esse sesion_start() inicia a sessão dando acesso ao vetor $_session[]/*
session_start();

//*/coletamos os dados existentes no vetor.../*
if(isset($_SESSION['nome_usuario']))
   $nome_usuario = $_SESSION['nome_usuario'];
if(isset($_SESSION['senha_usuario']))
   $senha_usuario = $_SESSION['senha_usuario'];

//   */aqui vamos verificar se temos algo registrado/*
   if(!(empty($nome_usuario) || empty($senha_usuario)))
   {
      
//      */Abre a conexão com o postgre e seleaciona o banco
	   require_once 'db.php';
	   
//      $sql=mysql_query("SELECT * FROM usuarios WHERE log_nome='$nome_usuario'");
//      $conta=mysql_num_rows($sql);
	   $query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$nome_usuario,'senha'=>$senha_usuario]]);			
	   $conta = sizeof($query);
	   
	   $qry = $query["0"];
      
      if($conta>=1)
      {
         if($senha_usuario != $qry["senha"])
         {
            unset($_SESSION['nome_usuario']);
            unset($_SESSION['senha_usuario']);
            echo "você não efetuou o login!";
            exit;
         }
      }
      else
      {
            unset($_SESSION['nome_usuario']);
            unset($_SESSION['senha_usuario']);
            echo "você não efetuou o login!";
            exit;
      }
   }
   else
   {
   echo "você não efetuou o Login!";
   exit;
   }   
?>