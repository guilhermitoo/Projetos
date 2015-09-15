<?php

require_once 'db.php';

$usuario = 'admin';
$senha = '123';

$query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);	

echo json_encode($query);