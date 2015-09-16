<?php

if ( isset($_POST) ){        		
	try
	{
        require_once 'db.php';
        
        $database->pdo->beginTransaction();
        
		$cliente_id = (integer) $_POST["cliente_id"];
		$valor_total = (float) str_replace(',','.', $_POST['valor_total']);
		$status = "P";                        
        
        // insere o pedido no banco de dados
        $database->insert("pedidos",[
                "cliente_id"=> $cliente_id,
                "valor_total"=> $valor_total,
                "status"=> $status
        ]);	
        // pega o id inserido acima
        $pedido_id = $database->query("SELECT LASTVAL() id")->fetchColumn();        
        
        $produtos = json_decode($_POST["itens"],true);
        
//        var_dump($produtos);
        
        if ( $pedido_id > 0 ) {
            //insere os itens	
    		for ( $i = 0 ; $i < sizeof($produtos) ; $i++ ) {
//            foreach ($produtos as $produto){

                $produto_id = (integer) $produtos[$i]['id'];
                $valor_unitario = (float) str_replace(',','.', $produtos[$i]['valor']);
                $quantidade = (integer) $produtos[$i]['quantidade'];

                $database->insert("pedidos_itens",[
                    "pedido_id"=> $pedido_id,
                    "produto_id"=> $produto_id,
                    "valor_unitario"=> $valor_unitario,
                    "quantidade"=> $quantidade
                ]);
            }
            //se chegar aqui, faz o commit
            $database->pdo->commit();
            echo 'Pedido nº ' . $pedido_id . ' cadastrado com sucesso!';                                    
        }
	}
	catch(Exception $e)
	{
		$database->pdo->rollBack();
		echo $e->getMessage();		
	}
}
?>