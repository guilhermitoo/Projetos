<?php
    
function Cadastra($cliente_id,$valor_total,$status) {
    require_once 'db.php';

    $id = $database->insert("pedidos",[
            "cliente_id"=> $cliente_id,
            "valor_total"=> $valor_total,
            "status"=> $status
    ]);	
    
    return $id;
}