extends Control

var itens = []

var pre_item = preload("res://scenes/item.tscn")

# acessar componentes
onready var v_itens = $vbx_filters/sc_itens/vbx_itens
onready var txtname = $vbx_filters/hbx_filters/gc_name/txt_name
onready var mbtier = $vbx_filters/hbx_filters/gc_tier/mb_tier 
onready var mblevel = $vbx_filters/hbx_filters/gc_level/mb_level

func _ready():
	clear()
	prepare_filters()
	load_itens()
	pass

func prepare_filters():
	for i in range(0,global.dict_tiers.keys().size()):
		mbtier.get_popup().add_item(global.dict_tiers.keys()[i])
#	mbtier.get_popup().add_item("Todos")
#	mbtier.get_popup().add_item("T1")
#	mbtier.get_popup().add_item("T2")
#	mbtier.get_popup().add_item("T3")
#	mbtier.get_popup().add_item("T4")
#	mbtier.get_popup().add_item("T5")
#	mbtier.get_popup().add_item("T6")
#	mbtier.get_popup().add_item("T7")
#	mbtier.get_popup().add_item("T8")
	mbtier.get_popup().connect("id_pressed",self,"_sel_item")
	
	mblevel.get_popup().add_item("Todos")
	mblevel.get_popup().add_item("Nv 0")
	mblevel.get_popup().add_item("Nv 1")
	mblevel.get_popup().add_item("Nv 2")
	mblevel.get_popup().add_item("Nv 3")
	mblevel.get_popup().connect("id_pressed",self,"_sel_item_nv")
	

func _sel_item(id):
	mbtier.text = mbtier.get_popup().get_item_text(id)

func _sel_item_nv(id):
	mblevel.text = mblevel.get_popup().get_item_text(id)

func load_itens():
	var file = File.new()
	file.open("res://items.json", file.READ)
	var text = file.get_as_text()
	var data_parse = JSON.parse(text)
	if data_parse.error != OK:
		print("ERRO")
	itens = data_parse.result
	file.close()

func search(content,tier,level):
	var ret = []
	for i in range(0,itens.size()):
		if itens[i].has(global.name_tag):
			var ut = str(itens[i][global.uniq_tag])
			# SEARCH FOR THE NAME
			if itens[i][global.name_tag] == null:
				continue
			if ! itens[i][global.name_tag].has(global.language):
				continue
			if ! (str(content).to_lower() in str(itens[i][global.name_tag][global.language]).to_lower()):
				continue
			# VERIFY TIERS
			if global.dict_tiers[tier]!="T":
				if ut.substr(0,2) != global.dict_tiers[tier]:
					continue
			# VERIFY LEVELS
			if global.dict_levels[level]!="T":
				if global.dict_levels[level]=="0":
					if "@" in ut: 
						continue
				elif ut.substr(ut.length()-2,2) != global.dict_levels[level]:
					continue
			ret.append(i)
	return ret 
	pass 

func _on_Button_pressed():
	clear()
	
	var content = txtname.text
	var tier = mbtier.text
	var level = mblevel.text
	var r = search(content,tier,level)
	
	for i in range(0,r.size()):
		add_item(r[i])
	
	pass # Replace with function body.

func clear():
	var node = v_itens
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func add_item(index):
	var it = pre_item.instance()
	it.ID = index
	if itens[index][global.desc_tag] != null:
		it.LOCALIZED_DESCRIPTION = itens[index][global.desc_tag][global.language]
	it.LOCALIZED_NAME = itens[index][global.name_tag][global.language]
	var ut = itens[index][global.uniq_tag]
	it.UNIQUE_NAME = ut
	it.TIER = int(ut.substr(1,1))
	if "@" in ut:
		it.LEVEL = int(ut.substr(ut.length()-1,1))
	else:
		it.LEVEL = 0
	it.update()
	v_itens.add_child(it)
	pass
