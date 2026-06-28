extends Button

@export var scene:String
@onready var click: AudioStreamPlayer = $"../click"
@onready var cantclick: AudioStreamPlayer = $"../cantclick"




func _on_pressed() -> void:
	if scene in Lvlsfinished.lvls_unclocked:
		click.play()
		await click.finished
		get_tree().change_scene_to_file(scene)
	else:
		cantclick.play()
