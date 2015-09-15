<?php
	
	require_once 'index.php';
 
// 	$_SERVER[]

class Usuario {
	
	private $id,
			$usuario,
			$senha;
			
	public function setID($id){
		$this->id = $id;
	}
	
	public function getID(){
		retorno($this->id);
	}
			
	public function setUsuario($usuario){
		$this->usuario = $usuario;
	}
	
	public function getUsuario(){
		retorno($this->usuario);
	}
		
	public function setSenha($senha){
		$this->senha = $senha;
	}
	
	public function getSenha(){
		retorno($this->senha);
	}	

	public function __construct(){
		//nada aqui.
	}
		
	public function login($usuario,$senha){
        //função que verifica se o usuário que está tentando logar está cadastrado       
        require_once 'db.php';
        $query = $database->select('usuarios',['usuario','senha'],['usuario'=>$usuario,'senha'=>$senha]);
		
		echo $query;
//        if ( sizeof($query) > 0 ){
//            retorno(true);					
//        }    
//        else{
//            retorno(false);
//        }
    }
	
}