extends Node
class_name Building
var city
var efficiencyMult

@export var peopleRequired: float
@export var resourcesRequiredID: Array[GameData.GameResources] 
@export var resourcesRequired: Array[float]
@export var resourcesProducedID: Array[GameData.GameResources]
@export var resourcesProduced: Array[float]

func InitBuilding(cityID):
	city = get_tree().get_nodes_in_group("City")[cityID]
	print("dajwkda")
func UpdateBuilding():
	
	for resourceID in resourcesRequired.size():
		city.resourcesStored[resourcesRequiredID[resourceID]] -= resourcesRequired[resourceID]
		
	for resourceID in resourcesRequired.size():
		city.resourcesStored[resourcesProducedID[resourceID]] += resourcesProduced[resourceID]
	
