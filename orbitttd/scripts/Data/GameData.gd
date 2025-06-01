extends Node

enum GameResources {Housing, Food, Water, Concrete, Chemicals, Metal, RareMetal, Volatiles, Fuel, Energy}
var resourceNames = ["Housing", "Food", "Water", "Concrete", "Chemicals", "Metal", "Rare Metal", "Volatiles", "Fuel", "Energy"]
var resourceBaseDecay = [0, 99, 0, 50, 95, 50, 75, 90, 65, 99]
enum UIState {None, Planet, City, Building, Ship}
var cameraTarget: Node2D = null

var pop = 0

func _process(delta: float) -> void:
	pop=0 #reset global pop and recalculate 
	for city in get_tree().get_nodes_in_group("City"):
		pop += city.pop
	#print(pop)
