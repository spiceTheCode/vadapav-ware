extends Button
@onready var parent = $".."
@onready var timer = $"../level_timer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	GlobalAudio.playSFX(load("res://Assets/Audio/vadaCollection/eww.mp3"))
	parent.bad_vada_pressed=true
