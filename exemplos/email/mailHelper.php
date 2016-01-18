<?php

require_once('lib/plugins/phpmailer/class.phpmailer.php');

    class mailHelper extends Controller{
     
        protected $host;
        protected $SMTP_Port;
        protected $SMTP_Secure;
        protected $SMTP_Auth;
        protected $Username;
        protected $Password;
        protected $From;
        protected $FromNome;
        protected $SendFor;
        protected $SendForNome;
        protected $ColabSendFor;
        protected $ColabSendForNome;
        protected $CoordSendFor;
        protected $CoordSendForNome;
        protected $ReplyTo;
        protected $ReplyToName;
        protected $Body;
        protected $Subject;
        protected $mailer;

            public function setHost($val){
                $this->host = $val;
                return $this;
            }
            public function setSMTPPort($val){
                $this->SMTP_Port = $val;
                return $this;
            }
            public function setSMTPSecure($val){
                $this->SMTP_Secure = $val;
                return $this;
            }
            public function setSMTPAuth($val){
                $this->SMTP_Auth = $val;
                return $this;
            }
            public function setUsername($val){
                $this->Username = $val;
                return $this;
            }
            public function setPassword($val){
                $this->Password = $val;
                return $this;
            }
            public function setFrom($val){
                $this->From = $val;
                return $this;
            }
            public function setFromName($val){
                $this->FromNome = $val;
                return $this;
            }
            public function addAddress($email, $nome){
                $this->mailer->AddAddress($email,  $nome);
            }
            public function setBody($val){
                $this->Body = $val;
                return $this;
            }
            public function setSubject($val){
                $this->Subject = $val;
                return $this;
            }
            public function montaCabecalho() {
                //instancia objetos
                $this->mailer = new PHPMailer();
                $this->mailer->SetLanguage("br", '/phpmailer/language/');

                // mandar via SMTP
                $this->mailer->IsSMTP(); 
                $this->mailer->PluginDir = 'lib/plugins/phpmailer/';
                // Seu servidor smtp
                $this->mailer->Host = $this->host; 
                $this->mailer->SMTP_Port = $this->SMTP_Port;
                $this->mailer->SMTPSecure = $this->SMTP_Secure;

                // habilita smtp autenticado
                $this->mailer->SMTPAuth = $this->SMTP_Auth; 

                // usuário deste servidor smtp
                $this->mailer->Username = $this->Username; 
                $this->mailer->Password = $this->Password; // senha

                //email utilizado para o envio 
                $this->mailer->From = $this->From;
                $this->mailer->FromName = $this->FromNome;
            }
            public function montaCorpo() {
                //wrap seta o tamanhdo do texto por linha
                $this->mailer->WordWrap = 50; 

                $this->mailer->IsHTML(true); //enviar em HTML

                $this->mailer->Subject = $this->Subject;

                //adicionando o html no corpo dation/json');
                $this->mailer->Body = $this->Body;
            }
            public function enviaEmail() {				
                //enviando e retornando o status de envio
                try{
					//$this->mailer->SMTPDebug = 4;    
					if(!$this->mailer->Send()) {
						return array('ENVIADO' => '0', 'MSG_ERRO' => $this->mailer->ErrorInfo);
					} else {
						return array('ENVIADO' => '1', 'MSG_ERRO' => '');
					}
				} catch (phpmailerException $e) {
					echo $e->errorMessage(); //Pretty error messages from PHPMailer
				} catch (Exception $e) {
					echo $e->getMessage(); //Boring error messages from anything else!
				}
            }
    }

