extends CharacterBody2D

@onready var main:Node2D = get_tree().get_root().get_node("main")
@onready var potBall=load("res://Scenes/potato_ball.tscn")
const SPEED = 300.0

func shoot():
	var ball = potBall.instantiate()
	ball.z_index = 1;
	z_index=2;
	ball.spawnPos = global_position
	add_collision_exception_with(ball)
	main.add_child.call_deferred(ball)

func _physics_process(delta: float) -> void:

	#  Shoot.
	if Input.is_action_just_pressed("ui_accept"):
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
