<?php

require_once 'usuarios.class.php';

$usuario = $_POST["usuario"];
$senha = $_POST["senha"];

$json_str = '{"usuario":'.$usuario.', "senha":'.$senha.'}';

$user = json_encode($json_str);

if ( login($usuario,$senha) ) {
    $_SESSION['user'] = $user;
}
else{
    unset($_SESSION['user']);
}

include("index.html");
