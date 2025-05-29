extends SpaceBody

@export var cityPrefab = preload("res://city.tscn")

@export var parentPlanet: Node2D
@export var cities: Array[Node2D]
var distanceToParent: float
var d = 0
@export var zoom = 1
@export var planetID: int = 0
var pos
var lineTimer = 0

func _ready() -> void:
	
	add_to_group("Sol")
	planetID = get_tree().get_nodes_in_group("Sol").size()
	distanceToParent = self.position.distance_to(parentPlanet.position) / zoom
	
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
		GameData.cameraTarget = self
		UiManager.planetTarget = self
		UiManager.OpenPlanetUI()
	if Input.is_action_just_pressed("DebugAddCity"):
		var cityToAdd = GamePrefabs.cityPrefab.instantiate()
		add_child(cityToAdd)
	if Input.is_action_just_pressed("DebugAddBuilding") and get_tree().get_nodes_in_group("City").size() > 0:
		var earthSlumsToAdd = GamePrefabs.earthSlumsPrefab.instantiate()
		
		get_tree().get_first_node_in_group("City").buildings.append(earthSlumsToAdd)
		get_tree().get_first_node_in_group("City").add_child(earthSlumsToAdd)
		earthSlumsToAdd.InitBuilding(0)
	pass # Replace with function body.
	
func AddNewCity(cityName: String):
	var cityToAdd = GamePrefabs.cityPrefab.instantiate()
	cityToAdd.cityName = cityName
	cityToAdd.planetID = planetID
	cities.append(cityToAdd)
	add_child(cityToAdd)
	
