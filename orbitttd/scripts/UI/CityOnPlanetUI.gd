extends Panel

var city: City

func _ready() -> void:
	if city != null:
		$HBoxContainer/CityName.text = city.cityName
		$HBoxContainer/PopulationText.text = str(city.pop)
	
func _process(delta: float) -> void:
	$HBoxContainer/PopulationText.text = str(snapped(city.pop, 0.001)) + "M"

#open city ui
func _on_texture_button_pressed() -> void:
	#close all ui
	UiManager.CloseUI()
	#make city ui
	var CityUIToAdd = GamePrefabs.cityBuildingMenuUI.instantiate()
	CityUIToAdd.city = city
	 
	get_tree().get_first_node_in_group("UI").add_child(CityUIToAdd)
	
	pass # Replace with function body.
