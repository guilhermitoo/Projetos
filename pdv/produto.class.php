<?php	

require_once 'index.php';

// 	$_SERVER[]

class Produto {
	
	private $id,
			$descricao,
			$unidade,
			$preco;
			
	public function setID($id){
		$this->id = $id;
	}
	
	public function getID(){
		retorno($this->id);
	}
			
	public function setDescricao($descricao){
		$this->descricao = $descricao;
	}
	
	public function getDescricao(){
		retorno($this->descricao);
	}
		
	public function setUnidade($unidade){
		$this->unidade = $unidade;
	}
	
	public function getUnidade(){
		retorno($this->unidade);
	}
	
	public function setPreco($preco){
		$this->preco = str_replace(',','.', $preco);
	}
	
	public function getPreco(){
		retorno(str_replace('.',',', $this->preco));
	}	

	public function __construct(){
		//nada aqui.
	}
	
//	public function __construct($descricao,$unidade,$preco){
//		$this->descricao = $descricao,
//		$this->unidade = $unidade,
//		$this->preco = $preco
//	}
		
	public function incluir(){
		require_once 'db.php';

		$id = $database->insert("produtos",[
			"descricao"=> $this->descricao,
			"unidade"=> $this->unidade,
			"preco"=> $this->preco
		]);				
	}
	
	public function listar($id=''){						
		require_once 'db.php';
		
		
	}
	
}