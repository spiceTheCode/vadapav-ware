extends Node2D
@onready var level_timer: Node2D= $level_timer
@onready var anim:AnimationPlayer = $SIKEART/gotchaAnim

@onready var sound:AudioStreamPlayer = $SIKEART/AudioStreamPlayer
@onready var vadaPavSound:AudioStreamPlayer = $vadaPavSound



var shouldSike = true
var vada_howmany = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await level_timer.Timer(12.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if vada_howmany == 3:
		if Global.minigames_done>3:
			get_tree().change_scene_to_file("res://Scenes/winner_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
			
	if timer_end:
		Global.minigames_done -= 1
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://Scenes/looser_scene.tscn")
		else:
			Global.lives -= 1
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		
func vada_collected(who:Node2D) -> void:
	who.collected = true
	vada_howmany = vada_howmany+1
	vadaPavSound.play()
	who.get_child(3).get_child(0).play("vadaPow")
	


func _on_psyche_area_entered(area: Area2D) -> void:
	if shouldSike:
		anim.play("gotcha")
		sound.play()


func _on_deactivate_sike_area_entered(area: Area2D) -> void:
	shouldSike = false
	
