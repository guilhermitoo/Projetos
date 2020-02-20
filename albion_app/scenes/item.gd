extends Panel

export(int) var ID = 0
var UNIQUE_NAME = ""
var LOCALIZED_NAME = ""
var LOCALIZED_DESCRIPTION = ""
var TIER = 1
var LEVEL = 0

func _ready():
	pass 
	
func update():
	$lbl_id.text = str(ID)
	$lbl_loc_name.text = LOCALIZED_NAME
	$lbl_desc.text = LOCALIZED_DESCRIPTION
	$lbl_level.text = str(LEVEL)
	$lbl_tier.text = global.tier_roman[TIER]
	$".".self_modulate = Color(global.colors[TIER])


func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var arr = json.result
	if ! arr == null:
		for i in range(0,arr.size()):
			if arr[i]["sell_price_min"] <= 0:
				continue
			new_name(arr[i]["city"])
			new_value(arr[i]["sell_price_min"])

func new_name(txt):
	var nl = Label.new()
	$grid_prices/vb_names.add_child(nl)
	nl.text = txt
	
func new_value(vl):
	var nl = Label.new()
	nl.add_font_override("font.tres",$lbl_desc.get_font("font"))
	$grid_prices/vb_values.add_child(nl)
	nl.text = str(global.number_format(vl,2,",","."))
	
func request_prices():
	var url = global.URL_PRICES+UNIQUE_NAME
	var error = $http_request.request(url)
	if error != OK:
		print("erro na requisição.")

