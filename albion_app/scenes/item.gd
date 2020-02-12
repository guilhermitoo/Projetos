extends Panel

export(int) var ID = 0
export var UNIQUE_NAME = ""
export var LOCALIZED_NAME = ""
export var LOCALIZED_DESCRIPTION = ""

func _ready():
	pass 
	
func update():
	$lbl_id.text = str(ID)
	$lbl_loc_name.text = LOCALIZED_NAME
	$lbl_desc.text = LOCALIZED_DESCRIPTION
