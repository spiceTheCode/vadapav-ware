extends Node2D

@onready var sfxPlayer:AudioStreamPlayer = $SFX

func playSFX(stream:AudioStream) -> void:
	if Global.audioSetting:
		sfxPlayer.stream = stream
		sfxPlayer.play()
