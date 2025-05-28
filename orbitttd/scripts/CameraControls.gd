extends Camera2D

@export var cameraSpeed:float
@export var zoomAmount:float
@export var zoomChange:float
@export var zoomInLimit:float
@export var zoomOutLimit:float
var cameraTargetChanged:bool = false
func _process(delta: float) -> void:
	
	if GameData.cameraTarget == null:
	
		if Input.is_action_pressed("MoveCameraLeft"):
			position.x-=cameraSpeed/zoomAmount
		elif Input.is_action_pressed("MoveCameraRight"):
			position.x+=cameraSpeed/zoomAmount
		if Input.is_action_pressed("MoveCameraUp"):
			position.y-=cameraSpeed/zoomAmount
		elif Input.is_action_pressed("MoveCameraDown"):
			position.y+=cameraSpeed/zoomAmount
	else:
		position = GameData.cameraTarget.global_position
		if !cameraTargetChanged:
			cameraTargetChanged = true
			
			zoomAmount = zoomInLimit
			zoom = Vector2(zoomAmount,zoomAmount)
		
		if Input.is_action_pressed("MoveCameraLeft") or Input.is_action_pressed("MoveCameraRight") or Input.is_action_pressed("MoveCameraUp") or Input.is_action_pressed("MoveCameraDown"):
			zoomAmount+=0.3
			GameData.cameraTarget = null
			cameraTargetChanged = false
		
			
	if Input.is_action_just_pressed("ZoomInCamera") and zoomAmount <= zoomInLimit:
		zoomAmount += zoomChange
		zoom = Vector2(zoomAmount,zoomAmount)
	elif Input.is_action_just_pressed("ZoomOutCamera") and zoomAmount >= zoomOutLimit :
		zoomAmount -= zoomChange
		zoom = Vector2(zoomAmount,zoomAmount)
