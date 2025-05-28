extends Panel

func _ready() -> void:
	
	if $"../..".targetPlanet != null:
		var planetData:PlanetData = $"../..".targetPlanet.planetData
		print(planetData)
		$VBoxContainer/PlanetName/PlanetName.text = planetData.planetName
		print("l;andkjan")
		SetPlanetType(planetData.planetType)
		
		$VBoxContainer/Population/HBoxContainer/PopData.text = str(planetData.population) + "M"
	
		$VBoxContainer/CityCount/HBoxContainer/CityCount.text = str(planetData.cities)
		
		$VBoxContainer/BuildingCount/HBoxContainer/BuildingCount.text = str(planetData.buildings)

func SetPlanetType(planetType):
	if planetType == 0:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "planetData.PlanetType.None"
	elif planetType == 1:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "Star"
	elif planetType == 2:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "Rocky"
	elif planetType == 3:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "RockyMetalic"
	elif planetType == 4:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "EarthLike"
	elif planetType == 5:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "Icey"
	elif planetType == 6:
		$VBoxContainer/PlanetType/HBoxContainer/PTData.text = "Gas"
