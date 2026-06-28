extends Area2D


@export var next_level:String
@onready var player: CharacterBody2D = $"../player"
@onready var next: AudioStreamPlayer = $next

func _on_body_entered(body: Node2D) -> void:
	if body.name != "player" or player.in_rotation:
		return

	Lvlsfinished.lvls_unclocked.append(next_level)
	get_tree().paused = true
	next.play()


	var sound_length: float = 0.0
	SceneTransition.transition()
	
	if next.stream != null:
		sound_length = next.stream.get_length()
	await get_tree().create_timer(sound_length).timeout

	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
