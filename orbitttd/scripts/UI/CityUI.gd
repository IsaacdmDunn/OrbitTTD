extends Control

var city:City

func _ready() -> void:
	add_to_group("UI")
	print(city)
	for building in city.buildings:
		print("dada")
		AddBuildingInfoUI(building)
		pass
	pass
func _process(delta: float) -> void:
		$Panel/HBoxContainer/CityInfo/VBoxContainer/City/CityName.text = city.cityName
		$Panel/HBoxContainer/CityInfo/VBoxContainer/Planet/PlanetName.text = get_tree().get_nodes_in_group("Sol")[city.planetID].planetData.planetName
		$Panel/HBoxContainer/CityInfo/VBoxContainer/BuildingCount/BuildingCount.text = str(city.buildings.size())
		$Panel/HBoxContainer/CityInfo/VBoxContainer/Population/PopCount.text = str(city.pop)

		$Panel/HBoxContainer/CityInfo/VBoxContainer/Population/PopCount.tooltip_text = "Population growth: " + str(city.pop * (city.birthRate - city.deathRate))
		
func AddBuildingInfoUI(building:Node2D):
	var buildingUIToAdd = GamePrefabs.buildingUIPrefab.instantiate()
	buildingUIToAdd.building = building
	$Panel/HBoxContainer/Buildings/VBoxContainer/BuildingsScrollContainer/VBoxContainer.add_child(buildingUIToAdd)
	pass


func _on_button_pressed() -> void:
	UiManager.CloseUI()
	var buildingMenu = UiManager.addBuildingUI.instantiate()
	buildingMenu.city = city
	buildingMenu.buildingToBuild = GamePrefabs.earthSlumsPrefab.instantiate()
	get_tree().get_first_node_in_group("UI").add_child(buildingMenu)
	print("???")
	pass # Replace with function body.
