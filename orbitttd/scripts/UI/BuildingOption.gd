extends Panel

var city: City
var buildingToBuild: Building

func _ready() -> void:
	print(buildingToBuild)
	$HBoxContainer/TextureRect.texture = buildingToBuild.buildingTexture
	$HBoxContainer/BuildingName.text = buildingToBuild.buildingType
	$HBoxContainer/Tier.text = "Tier: " + str(buildingToBuild.tier)
	$HBoxContainer/Upkeep.text = "Upkeep: "
	for i in buildingToBuild.resourcesRequired.size():
		$HBoxContainer/Upkeep.text += ""


func _on_button_pressed() -> void:
	city.buildings.append(buildingToBuild)
	pass # Replace with function body.
