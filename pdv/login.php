<html>
	<script src="js/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<title>PDV Login</title>
	<body>	
		<?php include('header.html'); 			
//			$_SESSION['senha'] = '123';
//			echo $_SESSION['senha'];
			?>
		<div class="center">
			<div class="col-md-4 col-xs-offset-4 jumbotron">				
				<div class="col-xs-12">
					<form type="post" action="index.php">
						<input id="usuario" type="text" class="form-control">
						<br />
						<input id="senha" type="text" class="form-control">
						<br />
						<button class="btn btn-primary" type="submit">Entrar</button>
					</form>						
				</div>
			</div>								
		</div>		
	</body>
	<script src="js/bootstrap.min.js"></script>  
</html>