extends Control

var city: City
var buildingToBuild: Node2D

func _process(delta: float) -> void:
	print("!!!")

func _ready() -> void:
	var optionToAdd = UiManager.buildingOption.instantiate()
	optionToAdd.city = city
	optionToAdd.buildingToBuild = buildingToBuild
	$Panel/VBoxContainer.add_child(optionToAdd)
	print("!!!")
	pass
