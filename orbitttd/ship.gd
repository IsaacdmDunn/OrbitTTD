extends Node2D

var velocity
var destination
var speed
var dir:Vector2
var orbitBody: Node2D
var d = 0
var offsetPos
func _ready() -> void:
	speed = 1
	destination = $"../Planet".position
	orbitBody = $"../Planet/Planet"
	pass
	
func _process(delta: float) -> void:
	d += delta
	destination = $"../Planet".position
	
	offsetPos = position
	MoveShipFast()
	velocity = offsetPos - position
	
	
	
	pass

func ChangeOrbitBody():
	if position.distance_to(orbitBody.position) > orbitBody.mass:
		var nearestStrongestOrbitAmount = 10000000
		for gravityWell in get_tree().get_nodes_in_group("Sol"):
			if position.distance_to(gravityWell.position) / (gravityWell.mass / position.distance_to(gravityWell.position))< nearestStrongestOrbitAmount:
				nearestStrongestOrbitAmount = position.distance_to(gravityWell.position) / (gravityWell.mass / position.distance_to(gravityWell.position))
				orbitBody = gravityWell
				
		#print(orbitBody.name)
		pass
	pass

func MoveShipFast():
	speed += 0.001
	dir = destination - position
	dir = dir.normalized()
	if position.distance_to(destination) > 25:
		position += dir * speed
	look_at(dir)

func Gravity():
	var gravityForce = (orbitBody.position - position) 
	gravityForce = gravityForce.normalized() * (orbitBody.mass / (position.distance_to(orbitBody.position)+ 0.000001) )
	position += gravityForce
