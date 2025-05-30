extends Panel

var city: Node2D
var buildingToBuild: Building

func _ready() -> void:
	add_to_group("UI")
	print( buildingToBuild.buildingType)
	$HBoxContainer/TextureRect.texture = buildingToBuild.buildingTexture
	$HBoxContainer/BuildingName.text = buildingToBuild.buildingType
	$HBoxContainer/Tier.text = "Tier: " + str(buildingToBuild.tier)
	$HBoxContainer/Upkeep.text = "Upkeep: "
	for i in buildingToBuild.resourcesRequired.size():
		$HBoxContainer/Upkeep.text += ""


func _on_button_pressed() -> void:
	print("Test" + buildingToBuild.name)
	buildingToBuild.city = city
	city.buildings.append(buildingToBuild)
	city.add_child(buildingToBuild)
	pass # Replace with function body.
