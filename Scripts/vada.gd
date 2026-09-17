extends Node2D
@onready var player:CharacterBody2D = $"../Player"
@onready var self_area = $Area2D
@onready var selfSprite : TextureRect = $Vada
@onready var player_area = $"../Player/Area2D"

signal vada_collected(who)
var collected = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not collected and player_area.overlaps_area(self_area):
		collected =true;
		if self.visible:
			vada_collected.emit(self)
			selfSprite.hide()
