<?php

if ( session_status() == PHP_SESSION_DISABLED ){
	session_start();
}

require_once 'db.php';

if ( isset($_POST) ){	
	// obtem os parâmetros do post
	$usuario = (string) $_POST['usuario'];
	$senha = (string) $_POST['senha'];
	// faz a busca do usuário
	$query = $database->select('usuarios',['usuario','senha'],['AND' => ['usuario'=>$usuario,'senha'=>$senha]]);		
	
//	$user = json_encode($query);	
	
	if ( empty($query) ){		
		$_SESSION['usuario'] = $usuario;		
		$_SESSION['senha'] = $senha;						
		
		echo "<script> alert('deu certo') </script>";
	}
	else{					
		unset($_SESSION['usuario']);
		unset($_SESSION['senha']);				
		
		echo "<script> alert('deu ruim') </script>";
	}
}

if ( !isset($_SESSION['usuario']) and !isset($_SESSION['senha']) ){
//	session_destroy();
	header("Location: login.php");	
}

?>

<html>
    <script src="js/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">

    <title>Ponto de Vendas</title>
    <body>           
		<?php include('header.html'); ?>
        <div class="col-md-12 jumbotron" name="menu">
            <center>
                <div class="col-md-12">                    
                    <button class="btn btn-primary" id="produtos">Cadastrar Produto</button> 
                    <button class="btn btn-primary" id="clientes">Cadastrar Cliente</button> 
                    <button class="btn btn-primary" id="pedidos">Cadastrar Pedido</button>                                                       
                    <button class="btn btn-success" id="listprodutos">Listar Produtos</button> 
                    <button class="btn btn-success" id="listclientes">Listar Clientes</button> 
                    <button class="btn btn-success" id="listpedidos">Listar Pedidos</button>                     
                </div>
            </center>
        </div>
        <div id="cadastro">
        </div>
    </body>
    
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    
        $(document).ready(function(){
            $("#produtos").click(function(){
                $.ajax({url: "produtos.html", success: function(r){
                    $("#cadastro").html(r);
                }});
            });
            $("#clientes").click(function(){
                $.ajax({url: "clientes.html", success: function(r){
                    $("#cadastro").html(r);
                }});
            });
            $("#pedidos").click(function(){
                $.ajax({url: "pedidos.html", success: function(r){
                    $("#cadastro").html(r);
                }});
            });                        
					
						// ==================
					
					  $("#listprodutos").click(function(){
                $.ajax({url: "ListaProdutos.html", success: function(r){
                    $("#cadastro").html(r);
                }});
            });
            $("#listclientes").click(function(){
                $.ajax({url: "ListaClientes.html", success: function(r){
                    $("#cadastro").html(r);
                }});
            });
            $("#listpedidos").click(function(){
                $.ajax({url: "ListaPedidos.html", success: function(r){
                    $("#cadastro").html(r);
                }});
            });
            
            $('#sair').click(function(){
                session.removeAttribute('user');
            });
        });            
        
        
    </script>
</html>