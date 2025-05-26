extends Node2D

@export var pop: float
@export var resourceProduction: Array[float]
@export var resourceAvailable: Array[float]
@export var resourceStorage: Array[float]
@export var buildings: Array[Node3D]

var birthRate = 2.09999999
var deathRate = 2.1

func _ready():
	rotation = randf_range(0,360)

func _process(delta: float) -> void:
		pop += pop * (birthRate - deathRate)
