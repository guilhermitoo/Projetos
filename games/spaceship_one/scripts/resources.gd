extends Node

var paths = []
var ini_tex = []
const path_dir = "res://paths/"
const ini_text_dir = 'res://sprites/Enemies/';

func _ready():
	carregarPaths()
	carregarTexturasInimigo()
	pass

func random_path():
	# gera aleatório de 0 a paths.size -1
	return paths[randi() % paths.size()]
	
func random_ini_text():
	return ini_tex[randi() % ini_tex.size()]
	
func carregarPaths():
	# cria um diretório na memória, uma instância de Directory
	var dir = Directory.new()
	dir.change_dir(path_dir)
	dir.list_dir_begin()
	
	#percorre todos os arquivos no diretório
	var path_file = dir.get_next()
	
	while path_file != "":
		var path = load(path_dir + path_file)
		# verifica se foi instanciado e se é um Curve2D
		if path && path extends Curve2D :
			# load carrega o diretório durante a execução do projeto
			paths.append(path)
		path_file = dir.get_next()
	print("caminhos carregados " + str(paths.size()))
	
func carregarTexturasInimigo():
	# cria um diretório na memória, uma instância de Directory
	var dir = Directory.new()
	dir.change_dir(ini_text_dir)
	dir.list_dir_begin()
	
	#percorre todos os arquivos no diretório
	var file = dir.get_next()
	
	while file != "":
		var tex = load(ini_text_dir + file)
		# verifica se foi instanciado e se é um Texture
		if tex && tex extends Texture :
			# load carrega o diretório durante a execução do projeto
				ini_tex.append(tex)
		file = dir.get_next()