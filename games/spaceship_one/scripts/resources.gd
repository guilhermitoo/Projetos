extends Node

var paths = []
const path_dir = "res://paths/"

func _ready():
	carregarPaths()
	pass

func random_path():
	# gera aleatório de 0 a paths.size -1
	return paths[randi() % paths.size()]

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