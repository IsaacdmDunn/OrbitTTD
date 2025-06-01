extends Node
class_name Building
var city
var efficiencyMult

@export var peopleRequired: float
@export var resourcesRequiredID: Array[GameData.GameResources] 
@export var resourcesRequired: Array[float]
@export var resourcesProducedID: Array[GameData.GameResources]
@export var resourcesProduced: Array[float]

@export var buildingCostID:Array[GameData.GameResources]
@export var buildingCost:Array[float]

@export var buildingType: String
@export var tier: int
@export var level: int
@export var buildingTexture: Texture2D

@export var levelUpCostIncrease: float = 1.2
@export var levelUpEffect: float = 1.01

func InitBuilding(cityID):
	city = get_tree().get_nodes_in_group("City")[cityID]
	if buildingType == null:
		buildingType = "John"
func UpdateBuilding():
	
	for resourceID in resourcesRequired.size():
		city.resourcesGain[resourcesRequiredID[resourceID]] -= resourcesRequired[resourceID] / 1000.0
		
	for resourceID in resourcesRequired.size():
		city.resourcesGain[resourcesProducedID[resourceID]] += resourcesProduced[resourceID] / 1000.0
		
func UpgradeBuilding():
	level+=1
	for resourceID in resourcesRequired.size():
		city.resourcesStored[resourcesRequiredID[resourceID]] = resourcesRequired[resourceID] * levelUpEffect
		
	for resourceID in resourcesRequired.size():
		city.resourcesStored[resourcesProducedID[resourceID]] = resourcesProduced[resourceID] * levelUpEffect
	pass
	
	
