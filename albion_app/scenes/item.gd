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
	$lbl_tier.text = str(TIER)
	$lbl_level.text = str(LEVEL)
	
