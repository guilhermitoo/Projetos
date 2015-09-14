<?php
	require_once 'db.php';
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
		$this->preco = $preco;
	}
	
	public function getPreco(){
		retorno($this->preco);
	}	

	public function __construct($id, $descricao, $unidade, $preco){
		//nada aqui.
	}
		
	public function incluir(){
		try
		{
			$id = $database->insert("produtos",[
				"descricao"=> getDescricao(),
				"unidade"=> getUnidade(),
				"preco"=> getPreco()
			]);
			retorno("cadastrado com sucesso");
		}catch()
		{
			retorno("erro ao cadastrar");
		}
	}
	
}