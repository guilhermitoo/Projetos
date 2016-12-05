extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_NAVE = "nave"

var score = 0 setget setScore
var pontuacao_por_meteoro = 10
var vel_background = 300 # escala que multiplica a velocidade do fundo

# PROPRIEDADE PARA CONTAR A VIDA
var nave_vida = 0 setget setVidas
var nave_velocidade = 460
# HP INICIAL DA NAVE
var nave_hp = 8

var chance_bonus = 100 # %
# libera os objetos que passarem da margem da tela + margem_acrescida_tela
var margem_acrescida_tela = 50
var jogo_rodando = true

# METEOR PROPERTIES
var meteor_interval_ini
var meteor_interval_fim
var meteor_vel_ini
var meteor_vel_fim
var meteor_rot_ini
var meteor_rot_fim 
var meteor_scale_ini 
var meteor_scale_fim 

var meteor_hp = 2 # HITPOINTS # VIDA

# SHOOT PROPERTIES
var shoot_vel = 800
var shoot_dano = 1
var shoot_municao_padrao = 40
var municao = 0 setget setMunicao

signal score_changed
signal lifes_changed
signal mun_changed

func _ready():
	setVidas(nave_hp)
	iniciarControles()
	randomize()
	pass

func setMunicao(valor):
	municao = valor
	emit_signal("mun_changed")
	pass

func getCamera():
	return getMain().get_node("camera")	
	pass
	
func getMain():
	return get_tree().get_root().get_node("main")
	pass
	
func setScore(valor):
	if valor > 0:
		score = valor
		emit_signal("score_changed")
		var delta = pontuacao_por_meteoro*get_process_delta_time()
		atualizarControles(delta)
	pass
	
func setVidas(valor):
	nave_vida = valor
	emit_signal("lifes_changed")
	pass
	
func estaForaTela(node):
	var retorno = false
	var tamanho_tela = OS.get_screen_size()
	var local_no = node.get_global_pos()
	retorno = retorno or ( local_no.x > (tamanho_tela.x+margem_acrescida_tela) )
	retorno = retorno or ( local_no.x < -margem_acrescida_tela ) 
	retorno = retorno or ( local_no.y > (tamanho_tela.y+margem_acrescida_tela) ) 
	retorno = retorno or ( local_no.y < -margem_acrescida_tela )
	return retorno
	pass
	
func pausar():
	if jogo_rodando:
		get_tree().set_pause( ! get_tree().is_paused())  
		var x = getMain().get_node("HUD").get_node("pause_menu")
		x.set_hidden(!x.is_hidden())
	pass
	
func sair():
	get_tree().quit()
	pass
	
func fimDeJogo():
	# termina o jogo
	jogo_rodando = false
	get_tree().set_pause(true)
	var x = getMain().get_node("HUD").get_node("game_over")
	x.set_hidden(false)
	pass
	
func alignGlobalCenter(node):
	var osx = OS.get_window_size().x
	
	node.set_global_pos(Vector2(((osx*0.5)-(node.get_size().x*0.5)),node.get_global_pos().y))
	pass
	
func atualizarControles(delta):
# AUMENTA A VELOCIDADE DOS METEOROS, COM RELAÇÃO AO SCORE E A VELOCIDADE DA CAMERA
	meteor_vel_ini = vel_background * 0.7
	meteor_vel_fim = vel_background
	# AUMENTA A FREQUÊNCIA DE SPAWN DE METEOROS, COM RELAÇÃO A SCORE
	if meteor_interval_ini > 0:
		meteor_interval_ini -= (delta * 0.5)
	if meteor_interval_fim > 0.5:
		meteor_interval_fim -= delta
		
	# AUMENTA A VELOCIDADE DA CÂMERA COM RELAÇÃO AO SCORE
	vel_background += delta*50
	pass
	
func iniciarControles():
	meteor_vel_ini = vel_background * 0.7
	meteor_vel_fim = vel_background
	meteor_interval_ini = 0.2
	meteor_interval_fim = 1.5
	meteor_rot_ini = -3
	meteor_rot_fim = 3
	meteor_scale_ini = 0.7
	meteor_scale_fim = 1.8
	pass