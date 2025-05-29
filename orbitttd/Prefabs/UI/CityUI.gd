extends Control

var city:City

func _ready() -> void:
	for building in city.buildings:
		AddBuildingInfoUI(building)
		pass
	pass
func _process(delta: float) -> void:
		$Panel/HBoxContainer/CityInfo/VBoxContainer/City/CityName.text = city.cityName
		$Panel/HBoxContainer/CityInfo/VBoxContainer/Planet/PlanetName.text = get_tree().get_nodes_in_group("Sol")[city.planetID].planetData.planetName
		$Panel/HBoxContainer/CityInfo/VBoxContainer/BuildingCount/BuildingCount.text = str(city.buildings.size())
		$Panel/HBoxContainer/CityInfo/VBoxContainer/Population/PopCount.text = str(city.pop)

		$Panel/HBoxContainer/CityInfo/VBoxContainer/Population/PopCount.tooltip_text = "Population growth: " + str(city.pop * (city.birthRate - city.deathRate))
		
func AddBuildingInfoUI(build:Node2D):
	pass
