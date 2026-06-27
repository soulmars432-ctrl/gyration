extends Button

@export var scene:String




func _on_pressed() -> void:
	if scene in Lvlsfinished.lvls_unclocked:
		get_tree().change_scene_to_file(scene)
