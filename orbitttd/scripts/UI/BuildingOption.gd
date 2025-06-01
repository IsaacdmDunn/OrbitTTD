extends Panel

var city: Node2D
var buildingToBuild: Building

func _ready() -> void:
	add_to_group("UI")
	$HBoxContainer/TextureRect.texture = buildingToBuild.buildingTexture
	$HBoxContainer/BuildingName.text = buildingToBuild.buildingType
	$HBoxContainer/Tier.text = "Tier: " + str(buildingToBuild.tier)
	$HBoxContainer/Upkeep.text = "Upkeep: "
	for i in buildingToBuild.resourcesRequired.size():
		$HBoxContainer/Upkeep.text += ""

func _process(delta: float) -> void:
	#disables button if cant afford building
	$HBoxContainer/Button.disabled=false
	for i in buildingToBuild.buildingCostID.size():
		if buildingToBuild.buildingCost[i] > city.resourcesStored[i]:
			$HBoxContainer/Button.disabled=true
		

func _on_button_pressed() -> void:
	#creates new building
	buildingToBuild.city = city
	city.buildings.append(buildingToBuild)
	city.add_child(buildingToBuild)
	BuyBuilding()
	pass # Replace with function body.

#uses resources to buy building
func BuyBuilding():
	for i in buildingToBuild.buildingCostID.size():
		city.resourcesStored[i] -= buildingToBuild.buildingCost[i]
