extends CharacterBody2D

@export var speed: float = 200.0   # Horizontal movement speed
@export var jump_force: float = 400.0  # Force applied when jumping
@export var gravity: float = 1000.0  # Gravity affecting the character

var jump_count: int = 0  # Track the number of jumps
const MAX_JUMPS: int = 2  # Maximum jumps allowed

func _physics_process(delta: float) -> void:
	# Reset horizontal velocity
	velocity.x = 0 

	# Handle left and right movement
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed

	# Check if the player is on the ground
	if is_on_floor():
		jump_count = 0  # Reset jump count when on the ground

	# Handle jumping
	if Input.is_action_just_pressed("ui_up"):
		if jump_count < MAX_JUMPS:
			velocity.y = -jump_force  # Apply jump force
			jump_count += 1  # Increment jump count

	# Apply gravity to the velocity
	velocity.y += gravity * delta

	# Move the character
	move_and_slide()  # Call without arguments; velocity is managed internally
