<?php

// função que verifica se tem algum usuário logado
function Logado(){
    session_start();

    if(isset($_SESSION['usuario']))
        $usuario = $_SESSION['usuario'];
    if(isset($_SESSION['senha']))
        $senha = $_SESSION['senha'];

    if(!(empty($usuario) || empty($senha)))
    {      
        require_once 'db.php';

        $query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);			
        $conta = sizeof($query);
        //pega a linha 0 da busca
        $qry = $query["0"];

        if($conta>=1)
        {
            if ( ($usuario == $qry["usuario"]) && ($senha == $qry["senha"]) ){
                return true;
                exit;
            }
            else{
                return false;
                exit;
            }        
        }
        else
        {
            unset($_SESSION['usuario']);
            unset($_SESSION['senha']);
            return false;
            exit;
        }
    }
    else
    {
        return false;
        exit;
    }   
}

// função que valida se o login está correto e adiciona na session
function validaLogin($usuario,$senha){
    // conexão postgreSQL
    require_once 'db.php';

    // Aqui veificamos se o usuario e senha informados na função existem e estão corretos
    $query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>utf8_encode($usuario),'senha'=>utf8_encode($senha)]]);			
    $qregistro = sizeof($query);

    if( $qregistro < 1 ){
       return false;
    } 
    else 
    {
        // Apos verificado ele grava o usuario e senha no vetor $_session[]
        session_start();
        $_SESSION['usuario']=$usuario;
        $_SESSION['senha']=$senha;
        return true;
    }
}

?>