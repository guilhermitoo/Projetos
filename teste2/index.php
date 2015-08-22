<html>
	<title>Teste conexao postgreSQL e alguns testes com formulários</title>
	<body>
		<?php 		
			$conn = "host=localhost port=5432 dbname=vendas user=postgres password=masterkey";
			
			$conexao = pg_connect($conn) or die ("Nao foi possivel estabelecer uma conexao com o servidor PostGreSQL");
			
			// se não está vazio, a conexão foi realizada com sucesso
			if ( ! empty($conexao) )
			{
				echo "conexao efetuada com sucesso";
			}
		?>
		
		<form action="script.php" method="post">
			</br>
			Campo 1: <input type="text" name=campo1><br>
			Campo 2: <input type="text" name=campo2><br>
			<!-- os tipos de botão para confirmar, como button ou input, basta ter o type submit para enviar o method -->
			<br><b> qual o seu S.O.? 	</b><br>
			<input type=radio name=sistema value="windows xp"> windows xp<br>
			<input type=radio name=sistema value="windows 7"> windows 7<br>
			<input type=radio name=sistema value="windows 8"> windows 8<br>
			<input type=radio name=sistema value="windows 10"> windows 10<br>
			<input type=radio name=sistema value="linux"> linux
			<br><br>
			<button type="submit" name=confirmar >Confirmar</button>
			<input type="submit" value="Ok">
		</form>					
	</body>
</html>