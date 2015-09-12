<?php
    require_once 'db.php';	

	$database->pdo->beginTransaction();
	try
	{
		$cliente_id = $_POST["cliente_id"];
		$valor_total = $_POST["valor_total"];
		array produtos = json_decode(json_encode($_POST["itens"]));
		
		// insere o pedido
		$pedido_id = $database->insert("pedidos",[
				"cliente_id"=> (integer) $cliente_id,
				"valor_total"=> (float) $valor_total
		]);
		//insere os itens	
		for ( $i = 0 ; $i < sizeof($produtos) ; $i++ ) {
			
			$produto_id = produtos[$i].id;
			$valor_unitario = produtos[$i].valor;
			$quantidade = produtos[$i].quantidade;
			
			$id = $database->insert("pedidos_itens",[
				"pedido_id"=> $pedido_id,
				"produto_id"=> $produto_id,
				"valor_unitario"=> $valor_unitario,
				"quantidade"=> $quantidade
			]);
		}
		//se chegar aqui, faz o commit
		$database->pdo->commit();
		echo 'Pedido cadastrado com sucesso!';
	}
	catch(PDOException $e)
	{
		$database->pdo->rollback();
		echo $e->getMessage();		
	}
		
