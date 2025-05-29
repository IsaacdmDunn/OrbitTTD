extends Node

enum GameResources {Housing, Food, Water, Concrete, Chemicals, Metal, RareMetal, Volatiles, Fuel, Energy}
enum UIState {None, Planet, City, Building, Ship}
var cameraTarget: Node2D = null

var pop = 0

func _process(delta: float) -> void:
	pop=0
	for city in get_tree().get_nodes_in_group("City"):
		pop += city.pop
	#print(pop)
