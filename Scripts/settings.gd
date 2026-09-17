extends Node2D
@onready var SFXBTN : Button = $SFX





func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_scene.tscn")
	


func _on_sfx_toggled(toggled_on: bool) -> void:
	Global.audioSetting = not toggled_on
	if Global.audioSetting:
		SFXBTN.text="SFX ON"
	else:
		SFXBTN.text="SFX OFF"
		
