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
	#debug add init speed and path
	speed = .3
	shipPath.append($"../Planet")
	shipPath.append($"../Planet/moon")
	shipPath.append($"../Planet2")
	pass
	
func _process(delta: float) -> void:
	#set destination as current ship path
	destination = shipPath[pathID].global_position
	
	
	#offsetPos = position
	MoveShipFast()
	#velocity = offsetPos - position
	
	
	
	pass


#take fastest route (direct full accel)
func MoveShipFast():
	#accel
	speed += 0.001
	
	#get dir
	dir = destination - position
	dir = dir.normalized()
	
	#if not at destination move
	if position.distance_to(destination) > 1:
		position += dir * speed
	#if at destination set next path on list
	else:
		speed = 0.3
		pathID+=1
		if pathID == shipPath.size():
			pathID = 0
		destination = shipPath[pathID]
	look_at(dir)
