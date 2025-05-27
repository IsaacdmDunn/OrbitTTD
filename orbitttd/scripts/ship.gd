extends Node2D
class_name Ship

var shipPath: Array[Node2D]
var pathID = 0
var velocity
var destination
var speed
var dir:Vector2
var orbitBody: Node2D
var d = 0
var offsetPos
func _ready() -> void:
	speed = .3
	shipPath.append($"../Planet")
	shipPath.append($"../Planet/moon")
	shipPath.append($"../Planet2")
	#destination = $"../Planet".position
	#orbitBody = $"../Planet/Planet"
	pass
	
func _process(delta: float) -> void:
	d += delta
	destination = shipPath[pathID].global_position
	
	offsetPos = position
	MoveShipFast()
	velocity = offsetPos - position
	
	
	
	pass



func MoveShipFast():
	
	speed += 0.001
	dir = destination - position
	dir = dir.normalized()
	if position.distance_to(destination) > 1:
		position += dir * speed
	else:
		speed = 0.3
		pathID+=1
		if pathID == shipPath.size():
			pathID = 0
		destination = shipPath[pathID]
	look_at(dir)
