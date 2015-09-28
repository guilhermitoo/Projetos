<?php
	include "valida_usuario.php";

    if ( isset($_POST) && ( isset($_POST['usuario']) && isset($_POST['senha'])) ) {
        $usuario = $_POST['usuario'];
        $senha = $_POST['senha'];
        
        if ( ! validaLogin($usuario,$senha) ) {
            header("location: login.php");
        }
    }
    else {
        if ( ! Logado() ){
            header("location: login.php");
        }    
    }
?>
<html>
    <script src="js/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <head>
        <meta charset="UTF-8" lang="pt-BR">
        <title>Ponto de Vendas</title>	    
    </head>			
    <body>           
		<?php 
            include "header.html";             
            echo "Usuario logado: " . $_SESSION['usuario'];
        ?>
		<form action='logout.php' type='post'><button type='submit' class='btn btn-danger' id='sair'>Sair</button></form>
		
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
