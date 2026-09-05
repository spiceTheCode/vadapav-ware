extends Node2D
@onready var chiliCont:HBoxContainer = $ChilliBox 
@onready var chilli:TextureRect = $ChilliBox/chilli 
@onready var chilli2:TextureRect = $ChilliBox/chilli2 
@onready var chilli3:TextureRect = $ChilliBox/chilli3 
@onready var chilli4:TextureRect = $ChilliBox/chilli4
@onready var chilli5:TextureRect = $ChilliBox/chilli5

@onready var level:RichTextLabel = $level
@onready var timer:RichTextLabel = $time

var time



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done<3:
		Global.minigames_done = Global.minigames_done+1
		get_tree().change_scene_to_file("res://minigame_"+str(Global.minigames_done)+".tscn")
	else:
		get_tree().change_scene_to_file("res://title_scene.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match Global.lives:
		4:
			chilli.hide()
		3:
			chilli.hide()
			chilli2.hide()
		2:
			chilli.hide()
			chilli2.hide()
			chilli3.hide()
		1:
			chilli.hide()
			chilli2.hide()
			chilli3.hide()
			chilli4.hide()
		0:
			chiliCont.hide()
	
	timer.text=str(time);
	level.text = "Levels completed: "+str(Global.minigames_done)
	
func Timer(start_time: float):
	time = start_time
	while time>0.0:
		await wait(0.1)
		time-=0.1
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
