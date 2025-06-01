extends Panel

var resourceTexture: Texture2D
var resourceName: String
var stored: float = 0
var max: float = 0
var gain: float = 0
var decay: float = 0

var resourceID 
var cities

func _process(delta: float) -> void:
	gain = 0
	
	for city in cities:
		if city.resourcesStored.size() > 0 and city.resourcesStored[0] != null:
			stored += city.resourcesStored[resourceID]
			max += city.resourcesStoredMax[resourceID]
			gain += city.resourcesGain[resourceID]
	$HBoxContainer/ResourceName.text = resourceName
	$HBoxContainer/Stored.text = str(stored) + " / " 
	$HBoxContainer/Max.text = str(max)
	$HBoxContainer/Gain.text = str(gain) + "/Yr"
	$HBoxContainer/Decay.text = str(decay) + "%"
