extends Area2D


@export var next_level:String
@onready var player: CharacterBody2D = $"../player"


func _on_body_entered(body: Node2D) -> void:
	print("no")
	if body.name == "player":
		print("not quite")
		if not player.in_rotation:
			print("yes tp")
			get_tree().change_scene_to_file(next_level)
