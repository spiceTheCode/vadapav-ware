extends Node2D
@onready var level_timer: Node2D= $level_timer

var vada_howmany = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await level_timer.Timer(12.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if vada_howmany == 3:
		if Global.minigames_done>1:
			get_tree().change_scene_to_file("res://done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")
			
	if timer_end:
		Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://level_scene.tscn")
		
func vada_collected() -> void:
	vada_howmany = vada_howmany+1
