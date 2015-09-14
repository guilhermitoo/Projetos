<?php
	require_once 'db.php';
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
        
        $query = $database->select('usuarios',['usuario','senha'],['usuario'=>$usuario,'senha'=>$senha]);
        
        if ( ! empty($query) ){
            retorno(true);
        }    
        else{
            retorno(false);
        }
    }
	
}