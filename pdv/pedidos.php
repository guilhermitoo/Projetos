<?
    require_once 'medoo.min.php';
 
    $database = new medoo();		

		$database->pdo->beginTransaction();
		try
		{
			$cliente_id = $_POST["cliente_id"];
			$valor_total = $_POST["valor_total"];
			$produtos = $json_decode($json_encode($_POST["produtos"]));
			
			// insere o pedido
			$id = $database->insert("pedidos",[
					"cliente_id"=> (integer) $cliente_id,
					"valor_total"=> (float) $valor_total
			]);
			//insere os itens	
			for ( $i = 0 ; $i < $produtos.length; $i++ ) {
				$id = $database->insert("pedidos_itens",[
					"pedido_id"=> (integer) $id,
					"produto_id"=> (integer) $produtos[$i].id,
					"quantidade"=> (integer) $produtos[$i].quantidade,
					"preco"=> (float) $produtos[$i].valor,
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
		
