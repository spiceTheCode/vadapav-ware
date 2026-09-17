extends Node2D
@onready var secondTexture = load("res://Assets/Visuals/ReadyVadapav.png")
@onready var CDTimer = $level_timer

var productReady = 0
var timer_end = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await CDTimer.Timer(10.0)
	timer_end = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if productReady == 3:
		if Global.minigames_done >= 3:
			get_tree().change_scene_to_file("res://Scenes/winner_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	if timer_end:
		Global.lives-=1
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://Scenes/looser_scene.tscn")
			pass
		else:
			Global.minigames_done-=1
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	pass


func _on_open_pav_2_vada_has_been_paved(whoPav:Sprite2D, whoVada:CharacterBody2D) -> void:
	whoPav.texture=secondTexture
	whoVada.hide()
	productReady+=1
	GlobalAudio.playSFX(load("res://Assets/Audio/vadapav.mp3"))


func _on_open_pav_vada_has_been_paved(whoPav:Sprite2D, whoVada:CharacterBody2D) -> void:
	whoPav.texture=secondTexture
	whoVada.hide()
	productReady+=1
	GlobalAudio.playSFX(load("res://Assets/Audio/vadapav.mp3"))


func _on_open_pav_3_vada_has_been_paved(whoPav:Sprite2D, whoVada:CharacterBody2D) -> void:
	whoPav.texture=secondTexture
	whoVada.hide()
	productReady+=1
	GlobalAudio.playSFX(load("res://Assets/Audio/vadapav.mp3"))
