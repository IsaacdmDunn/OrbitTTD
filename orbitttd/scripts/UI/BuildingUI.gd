extends Panel

var building: Building

func _ready() -> void:
	UpdateBuildingInfo()
	
func UpdateBuildingInfo():
	$HBoxContainer/Icon.texture = building.buildingTexture
	$HBoxContainer/BuildingType.text = building.buildingType
	$HBoxContainer/Lvl.text = "LVL: " + str(building.level)
	$HBoxContainer/Tier.text = "Tier: " + str(building.tier)


func _on_lvl_up_button_pressed() -> void:
	building.level += 1
	UpdateBuildingInfo()
	pass # Replace with function body.


func _on_upgrade_tier_pressed() -> void:
	building.tier += 1
	UpdateBuildingInfo()
	pass # Replace with function body.
