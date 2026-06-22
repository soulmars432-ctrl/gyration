extends CharacterBody2D


var is_on_ground = true  
func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		is_on_ground = false
		velocity += get_gravity() * delta
	else: 
		is_on_ground = true
	move_and_slide()
