extends SpaceBody

@export var cityPrefab = preload("res://city.tscn")

@export var parentPlanet: Node2D
@export var cities: Array[Node2D]
var distanceToParent: float
var d = 0
var zoom = 3
var pos

var lineTimer = 0
func _ready() -> void:
	add_to_group("Sol")
	distanceToParent = self.position.distance_to(parentPlanet.position) * zoom
	
	
	print(parentPlanet.position)
	
func _process(delta: float) -> void:
	pos = position
	d += delta / 250
	
	$Line2D.global_position = Vector2(0,0)
	position = Vector2(sin(d * speed) * distanceToParent, cos(d * speed) * distanceToParent) 
	
	$Icon.rotation = rotation + rotationSpeed 
	lineTimer += delta
	if lineTimer*speed > 10:
		lineTimer = 0
		$Line2D.add_point(global_position,0)
		if $Line2D.points.size() > 100:
			$Line2D.remove_point($Line2D.points.size()-1)
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Select"):
		print(cities[0].pop)
		print("adknkdjan")
	if Input.is_action_just_pressed("DebugAddCity"):
		var cityToAdd = cityPrefab.instantiate()
		add_child(cityToAdd)
	if Input.is_action_just_pressed("DebugAddBuilding"):
		print("buildin")
	pass # Replace with function body.
