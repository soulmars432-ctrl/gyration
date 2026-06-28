extends Button

@export var scene:String
@onready var click: AudioStreamPlayer = $"../click"




func _on_pressed() -> void:
	click.play()
	await click.finished
	get_tree().change_scene_to_file(scene)
