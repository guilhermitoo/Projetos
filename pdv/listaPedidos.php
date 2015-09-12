<?php
	require_once 'db.php';

  if (isset($_GET['id'])){
	  $query = $database->select('pedidos',
                                 ["[<>]clientes"=>["cliente_id"=>"id"]],
                                 ['pedidos.id',
                                  'pedidos.cliente_id',
                                  'clientes.nome(cliente_nome)',
                                  'pedidos.valor_total',
                                  'pedidos.status'],
                                 ['pedidos.id'=>$_GET['id']]);
	}else{
        $query = $database->select('pedidos',
                                 ["[><]clientes"=>["cliente_id"=>"id"]],
                                 ['pedidos.id',
                                  'pedidos.cliente_id',
                                  'clientes.nome(cliente_nome)',
                                  'pedidos.valor_total',
                                  'pedidos.status'
                                 ]);
	}

	echo json_encode($query);

	