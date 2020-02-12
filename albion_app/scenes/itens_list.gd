extends Control

var itens = []

var pre_item = preload("res://scenes/item.tscn")

const name_tag = "LocalizedNames"
const desc_tag = "LocalizedDescriptions"

func _ready():
	clear()
	var file = File.new()
	file.open("res://items.json", file.READ)
	var text = file.get_as_text()
	var data_parse = JSON.parse(text)
	if data_parse.error != OK:
		print("ERRO")
	itens = data_parse.result
	file.close()
	pass

func search_name(content):
	var ret = []
	for i in range(0,itens.size()):
		if itens[i].has(name_tag):
			if itens[i][name_tag] == null:
				continue
			if itens[i][name_tag].has(global.language):
				if str(content).to_lower() in str(itens[i][name_tag][global.language]).to_lower():
					ret.append(i)
	return ret 
	pass 

func _on_Button_pressed():
	clear()
	
	var content = $txt1.text
	var r = search_name(content)
	
	for i in range(0,r.size()):
		add_item(r[i])
	
	pass # Replace with function body.

func clear():
	var node = $ScrollContainer/VBoxContainer
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func add_item(index):
	var it = pre_item.instance()
	it.ID = index
	it.LOCALIZED_DESCRIPTION = itens[index][desc_tag][global.language]
	it.LOCALIZED_NAME = itens[index][name_tag][global.language]
	it.update()
	$ScrollContainer/VBoxContainer.add_child(it)
	pass