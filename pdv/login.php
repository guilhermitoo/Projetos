<html>
	<script src="js/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<title>PDV Login</title>
	<body>	
		<?php include('header.html'); ?>
		<div class="center">
			<div class="col-md-4 col-xs-offset-4 jumbotron">				
				<div class="col-xs-12">
					<form method="post" action="vlog.php" name="formulario">
						<input name="login" type="text" class="form-control">
						<br />
						<input name="senha" type="text" class="form-control">
						<br />
						<button class="btn btn-primary" type="submit">Entrar</button>
					</form>						
				</div>
			</div>								
		</div>		
	</body>
	<script src="js/bootstrap.min.js"></script>  
</html>