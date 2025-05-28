extends Node
class_name PlanetData

enum PlanetType {None, Star, Rocky, RockyMetalic, EarthLike, Icey, Gas,}

@export var planetName: String = "N/a"
@export var planetType = PlanetType.None
@export var cities: int = 0
@export var buildings: int = 0
@export var population: float = 0
@export var planetTexture: Texture2D

#set max resoucres with -1 meaning infinate
@export var maxBaseHousing = 0
@export var maxBaseFarms = 0
@export var maxBaseWater = 0
@export var maxBaseVolitileMine = 0
@export var maxBaseMetalMine = 0
@export var maxBaseRareMetalMine = 0
@export var maxBaseOilWell = 0
