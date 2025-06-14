extends Panel

var building: Building
var city: Node2D

func _ready() -> void:
	UpdateBuildingInfo()
	
func UpdateBuildingInfo():
	$HBoxContainer/Icon.texture = building.buildingTexture
	$HBoxContainer/BuildingType.text = building.buildingType
	$HBoxContainer/Lvl.text = "LVL: " + str(building.level)
	$HBoxContainer/Tier.text = "Tier: " + str(building.tier)
	
	#disables level up button if cant afford or allowed
	$"HBoxContainer/VBoxContainer/Lvl Up Button".disabled=false
	for i in building.buildingCostID.size():
		if building.buildingCost[i] * building.levelUpCostIncrease > city.resourcesStored[i]:
			$"HBoxContainer/VBoxContainer/Lvl Up Button".disabled=true
			
	#disables level up button if cant afford or allowed
	$HBoxContainer/VBoxContainer/UpgradeTier.disabled=false
	for i in building.buildingCostID.size():
		if building.buildingCost[i] > city.resourcesStored[i]:
			$HBoxContainer/VBoxContainer/UpgradeTier.disabled=true

#buy and upgrades building
func _on_lvl_up_button_pressed() -> void:
	BuyBuildingUpgrade
	building.UpgradeBuilding()
	UpdateBuildingInfo()
	pass # Replace with function body.

#buy and upgrades building
func _on_upgrade_tier_pressed() -> void:
	building.tier += 1
	UpdateBuildingInfo()
	pass # Replace with function body.

#uses resources to upgrad
func BuyBuildingUpgrade():
	for i in building.buildingCostID.size():
		city.resourcesStored[i] -= building.buildingCost[i]
