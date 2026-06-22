extends Area2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_colliding = false
var wall_pos
@onready var ray: RayCast2D = $RayCast2D

func _process(delta: float) -> void:
	rotation_degrees = 0 
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	if ray.is_colliding():
		wall_pos = ray.get_collision_point()
	if !is_colliding and wall_pos:
		# make wall pos work with the size
		wall_pos.y = wall_pos.y -32
		tween.tween_property(self, "position", wall_pos, 0.5)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "wall":
		is_colliding = true
