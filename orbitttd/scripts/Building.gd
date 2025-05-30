extends Node
class_name Building
var city
var efficiencyMult

@export var peopleRequired: float
@export var resourcesRequiredID: Array[GameData.GameResources] 
@export var resourcesRequired: Array[float]
@export var resourcesProducedID: Array[GameData.GameResources]
@export var resourcesProduced: Array[float]

@export var buildingType: String
@export var tier: int
@export var level: int
@export var buildingTexture: Texture2D

func InitBuilding(cityID):
	city = get_tree().get_nodes_in_group("City")[cityID]
	if buildingType == null:
		buildingType = "John"
	print(buildingType)
func UpdateBuilding():
	
	for resourceID in resourcesRequired.size():
		city.resourcesGain[resourcesRequiredID[resourceID]] -= resourcesRequired[resourceID]
		
	for resourceID in resourcesRequired.size():
		city.resourcesGain[resourcesProducedID[resourceID]] += resourcesProduced[resourceID]
	
