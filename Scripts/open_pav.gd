extends CharacterBody2D
signal vadaHasBeenPaved(whoPav, whoVada)
@onready var sprite:Sprite2D = $Sprite2D

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
	
func touchedYa(who:CharacterBody2D) -> void:
	print("vada was touched by ", who)
	vadaHasBeenPaved.emit(sprite, who)
