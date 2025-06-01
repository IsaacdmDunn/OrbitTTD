extends Control

var city: Node2D
var buildingToBuild: Node2D


func _ready() -> void:
	#adds building options using city and building data
	add_to_group("UI")
	var optionToAdd = UiManager.buildingOption.instantiate()
	optionToAdd.city = city
	optionToAdd.buildingToBuild = buildingToBuild
	
	$Panel/VBoxContainer.add_child(optionToAdd)
	pass
