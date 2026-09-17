extends Button
@onready var parent = $".."
@onready var vadaAudio : AudioStreamPlayer = $"../AudioStreamPlayer"
@onready var timer = $"../level_timer"

var audios = ["delicious.mp3","divine.mp3","marvelous.mp3","tasty.mp3"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	hide()
	var currStream = load("res://Assets/Audio/vadaCollection/"+audios.pick_random())
	GlobalAudio.playSFX(currStream)
	parent.button_pressed +=1
	pass # Replace with function body.
