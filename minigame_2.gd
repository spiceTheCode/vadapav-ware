extends Node2D
@onready var CDtimer:Node2D = $level_timer

var button_pressed = 0
var timer_end = false
var bad_vada_pressed = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await CDtimer.Timer(4.0)
	timer_end = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed == 4:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")
	
	if timer_end || bad_vada_pressed:
		Global.lives-=1
		Global.minigames_done-=1
		get_tree().change_scene_to_file("res://level_scene.tscn")
	pass
