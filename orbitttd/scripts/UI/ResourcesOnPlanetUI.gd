extends Panel

func _ready() -> void:
	for resourceToAdd in GameData.GameResources.size():
		var resourceUIToAdd = UiManager.resourceUI.instantiate()
		resourceUIToAdd.resourceName = GameData.resourceNames[resourceToAdd]
		resourceUIToAdd.cities = $"../..".targetPlanet.cities
		print(resourceUIToAdd.cities.size())
		resourceUIToAdd.resourceID = resourceToAdd
		for cities in $"../..".targetPlanet.cities:
			resourceUIToAdd.stored += cities.resourcesStored[resourceToAdd]
			resourceUIToAdd.max += cities.resourcesStoredMax[resourceToAdd]
			resourceUIToAdd.gain += cities.resourcesGain[resourceToAdd]
			resourceUIToAdd.decay += cities.resourcesDecay[resourceToAdd]
			pass
		$VBoxContainer/ResourcesUI/VBoxContainer.add_child(resourceUIToAdd)
	#each resource
		#each city resource data
	pass
