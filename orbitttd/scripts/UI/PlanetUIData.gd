extends Control



var targetPlanet: Node2D
enum UITabState {Planet, Cities, Buildings, Resources}
var currentTabState:UITabState = UITabState.Planet

func _ready() -> void:
	add_to_group("UI")

#change focused UI tab
func _on_tab_bar_tab_changed(tab: int) -> void:
	GetTabMenu(tab).visible = true
	GetTabMenu(tab).position.x = 0
	HideTabMenu(currentTabState)
	currentTabState = tab
	pass # Replace with function body.

#hide ui
func HideTabMenu(_currentTabState):
	GetTabMenu(_currentTabState).position.x = -$".".size.x
	GetTabMenu(_currentTabState).hide()

#change ui state
func GetTabMenu(tabState: UITabState):
	if tabState == UITabState.Planet:
		return $Panel/PlanetPanel
	elif tabState == UITabState.Cities:
		return $Panel/Cities
	elif tabState == UITabState.Buildings:
		return $Panel/Buildings
	elif tabState == UITabState.Resources:
		return $Panel/Resources
	
