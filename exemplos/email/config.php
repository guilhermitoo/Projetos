<?php

require_once ('mailHelper.php');

class SendMail extends mailHelper{

    public function configEmail(){
//             ->setSMTPPort(587) //NÃO MEXER!
//             ->setSMTPSecure("ssl") //NÃO MEXER!
        $this->setHost("email-ssl.com.br") //NÃO MEXER!
             ->setSMTPAuth(true) //NÃO MEXER!
             ->setUsername("naoresponda@windsoft.com.br") //USER EMAIL!
             ->setPassword("ws#32156809") //SENHA EMAIL!
             ->setFrom("naoresponda@windsoft.com.br") //EMAIL USADO!
             ->setFromName("Suporte - Windsoft Sistemas")
             ->montaCabecalho();
    }
      
    public function email() {
        header("Content-Type: text/html; charset=utf8");
        $subject = "Assunto";
        $email = "<p>Corpo do email</p>";   
        
        $this->addAddress($email1, $nome1);
        $this->addAddress($email2, $nome2);
        $this->addAddress($email3, $nome3);
        
        try{
            $this->setBody($email); //CORPO DO EMAIL
            $this->setSubject($subject);
            $this->montaCorpo();
            $resposta = $this->enviaEmail();
            if($resposta['ENVIADO']){
                echo 'ok';
            }else{
                echo $resposta['MSG_ERRO'];
            }
        } catch(PDOException $e){
            echo $e->getMessage();
        }
    }