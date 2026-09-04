extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
	
	if direction.x < 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
	
	if velocity.length() > 0:
		animated_sprite_2d.play("Walk")
	else:
		animated_sprite_2d.play("Idle")
