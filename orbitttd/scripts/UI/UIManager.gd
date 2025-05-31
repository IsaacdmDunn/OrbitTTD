extends Node

@export var planetUI = preload("res://Prefabs/UI/planetUI.tscn")
@export var addBuildingUI = preload("res://Prefabs/UI/AddNewBuilding.tscn")
@export var buildingOption = preload("res://Prefabs/UI/BuildingOptionUI.tscn")
@export var resourceUI = preload("res://Prefabs/UI/ResourcesUI.tscn")

var openUI
var planetTarget 

func OpenPlanetUI():
	openUI = planetUI.instantiate()
	openUI.targetPlanet = planetTarget
	get_tree().get_first_node_in_group("UI").add_child(openUI)
	
func CloseUI():
	for ui in get_tree().get_nodes_in_group("UI").size():
		if ui == 0:
			continue
		get_tree().get_nodes_in_group("UI")[ui].queue_free()
		
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("EscapeMenus"):
		UiManager.CloseUI()
	
