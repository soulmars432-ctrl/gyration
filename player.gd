extends CharacterBody2D

const SPEED = 900.0

# Direction the character is currently sliding in
var slide_direction: Vector2 = Vector2.ZERO
var is_sliding: bool = false
var in_rotation: bool = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Only accept new input when not already sliding
	if not is_sliding and !in_rotation:
		var input = Vector2.ZERO
		sprite.stop()
		
		if Input.is_action_just_pressed("d"):
			input = Vector2.RIGHT
			sprite.play("right")
		elif Input.is_action_just_pressed("a"):
			input = Vector2.LEFT
			sprite.play("left")
		elif Input.is_action_just_pressed("s"):
			input = Vector2.DOWN
			sprite.play("down")
		elif Input.is_action_just_pressed("w"):
			input = Vector2.UP
			sprite.play("up")
		
		if input != Vector2.ZERO:
			slide_direction = input
			is_sliding = true

	if is_sliding:
		velocity = slide_direction * SPEED
		move_and_slide()
		
		# Stop when we hit a wall in the direction we're moving
		if is_on_wall() or is_on_ceiling() or is_on_floor():
			# Check if we actually collided in our movement direction
			for i in get_slide_collision_count():
				var collision = get_slide_collision(i)
				var normal = collision.get_normal()
				# The wall normal opposes our direction → we hit a wall ahead
				if normal.dot(slide_direction) < -0.5:
					velocity = Vector2.ZERO
					is_sliding = false
					break
