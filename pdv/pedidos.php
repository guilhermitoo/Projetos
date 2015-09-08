<?
    require_once 'medoo.min.php';
 
    $database = new medoo();		

		$database->pdo->beginTransaction();
		try
		{
			// insere o pedido
			$id = $database->insert("pedidos",[
					"cliente_id"=> (integer) $_POST["cliente_id"],
					"valor_total"=> (float) $_POST["valor_total"]
			]);
			//insere os itens	
			
			//se chegar aqui, faz o commit
			$database->pdo->commit();
		}
		catch()
		{
			$database->pdo->rollback();
		}
		