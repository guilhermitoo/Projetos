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


func _on_Button_pressed():
	var url = global.URL_PRICES+UNIQUE_NAME
	var error = $http_request.request(url)
	if error != OK:
		print("erro")
	pass # Replace with function body.


func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	pass # Replace with function body.
