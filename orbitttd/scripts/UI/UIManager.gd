extends Node

@export var planetUI = preload("res://Prefabs/UI/planetUI.tscn")
var openUI
var planetTarget 

func OpenPlanetUI():
	openUI = planetUI.instantiate()
	openUI.targetPlanet = planetTarget
	get_tree().get_first_node_in_group("UI").add_child(openUI)
	
