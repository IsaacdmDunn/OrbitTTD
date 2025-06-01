extends Panel
var cityUIPrefab = preload("res://Prefabs/UI/CityOnPlanetUI.tscn")


func _ready() -> void:
	for cities in $"../..".targetPlanet.cities.size():
		var cityUIToAdd = cityUIPrefab.instantiate()
		cityUIToAdd.city = $"../..".targetPlanet.cities[cities]
		$VBoxContainer/ScrollContainer/VBoxContainer.add_child(cityUIToAdd)

#create new city with name
func _on_button_pressed() -> void:
	#add new city
	var newCityName = $"VBoxContainer/Add new city/HBoxContainer/TextEdit".text
	$"../..".targetPlanet.AddNewCity(newCityName)
	var cityUIToAdd = cityUIPrefab.instantiate()
	cityUIToAdd.city = $"../..".targetPlanet.cities[$"../..".targetPlanet.cities.size() - 1]
	$VBoxContainer/ScrollContainer/VBoxContainer.add_child(cityUIToAdd)
	pass # Replace with function body.
