<?php
    

//    $database->pdo->beginTransaction();
if ( isset($_POST) ){        		
	try
	{        
		$cliente_id = (integer) $_POST["cliente_id"];
		$valor_total = str_replace(',','.', $_POST['valor_total']);
		$status = 'P';
                        
//        echo "cliente: " . $cliente_id . " total: " . $valor_total . " status: " . $status;
        require_once 'pedido.php'; 
            
        $pedido_id = Cadastra($cliente_id,$valor_total,$status);
        
        echo "numero pedido: " . $pedido_id;
        
        $produtos = json_encode($_POST["itens"]);
        if ( $pedido_id > 0 ) {
            //insere os itens	
    //		for ( $i = 0 ; $i < sizeof($produtos) ; $i++ ) {
            foreach ($produtos as $produto){

                $produto_id = $produto->id;
                $valor_unitario = $produto->valor;
                $quantidade = $produto->quantidade;

                $id = $database->insert("pedidos_itens",[
                    "pedido_id"=> $pedido_id,
                    "produto_id"=> $produto_id,
                    "valor_unitario"=> $valor_unitario,
                    "quantidade"=> $quantidade
                ]);
            }
            //se chegar aqui, faz o commit
//            $database->pdo->commit();
            echo 'Pedido cadastrado com sucesso!';
        }
	}
	catch(Exception $e)
	{
//		$database->pdo->rollBack();
		echo $e->getMessage();		
	}
}
?>