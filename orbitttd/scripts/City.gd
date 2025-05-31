extends Node2D
class_name City
@export var planetID: int
@export var pop: float
@export var buildings: Array[Node2D]
@export var resourcesStored: Array[float] 
@export var resourcesStoredMax: Array[float] 
@export var resourcesGain: Array[float] 
@export var resourcesDecay: Array[float] 
var birthRate: float = 2.1000001
var deathRate: float = 2.1
@export var cityName: String = "Default City Name"

func _ready():
	resourcesStored.resize(GameData.GameResources.size())
	resourcesStoredMax.resize(GameData.GameResources.size())
	resourcesGain.resize(GameData.GameResources.size())
	resourcesDecay.resize(GameData.GameResources.size())
	
	rotation = randf_range(0,360)
	add_to_group("City")
	
func _process(delta: float) -> void:
	for r in GameData.GameResources.size():
		resourcesGain[r] = 0
		resourcesDecay[r] = GameData.resourceBaseDecay[r]
	pop += pop * (birthRate - deathRate)
	
	for building in buildings:
		building.UpdateBuilding()
		
	for r in GameData.GameResources.size():
		resourcesStored[r] += resourcesGain[r]
		
		
func AddBuilding(building):
	buildings.append(building)
	building.city = self
	add_child(building)
