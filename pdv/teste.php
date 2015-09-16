<?php

require_once 'db.php';
//
//$usuario = 'admin';
//$senha = '123';
//
//$query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);	
//
//echo json_encode($query);

$cliente_id = (integer) $_POST["cliente_id"];
$valor_total = (float) str_replace(',','.', $_POST['valor_total']);
$status = "P";

//$cliente_id = 2;
//$valor_total = 22;
//$status = "P";

echo "cliente: " . $cliente_id . "valor total: " . $valor_total . "status: " . $status;

    
$id = $database->insert("pedidos",[
        "cliente_id"=> $cliente_id,
        "valor_total"=> $valor_total,
        "status"=> $status
]);

//echo "id: " . $id;