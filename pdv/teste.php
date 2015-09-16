<?php

require_once 'db.php';
//
//$usuario = 'admin';
//$senha = '123';
//
//$query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);	
//
//echo json_encode($query);

$cliente_id = 2;
$valor_total = 12.2;
$status = 'P';

$id = $database->insert("pedidos",[
        "cliente_id"=> $cliente_id,
        "valor_total"=> $valor_total,
        "status"=> $status
]);

echo "id: " . $database->pdo->lastInsertId();