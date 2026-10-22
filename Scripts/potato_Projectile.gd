extends CharacterBody2D

@export var speed = 400
signal exploded

var spawnPos : Vector2

func _ready() -> void:
	global_position = spawnPos

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,-speed)
	move_and_slide()



func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("potatoExplosion")):
		emit_signal("exploded")
