extends Button

@export var scene:String
@export var lock:ColorRect
@onready var cantclick: AudioStreamPlayer = $"../../../cantclick"
@onready var click: AudioStreamPlayer = $"../../../click"


func _process(delta: float) -> void:
	if scene in Lvlsfinished.lvls_unclocked:
		lock.visible = false
	else:
		lock.visible = true

func _on_pressed() -> void:
	if scene in Lvlsfinished.lvls_unclocked:
		lock.visible = false
		click.play()
		await click.finished
		get_tree().change_scene_to_file(scene)
	else:
		lock.visible = true
		cantclick.play()
