extends CharacterBody2D
@onready var target:CharacterBody2D 

var flag = false
var dragOffset:Vector2 = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if flag:
		position = get_global_mouse_position()-dragOffset
	pass


func _on_button_button_up() -> void:
	flag = false


func _on_button_button_down() -> void:
	flag = true
	dragOffset = get_global_mouse_position() - global_position


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("pav"):
		var daddyPav=area.get_parent()
		daddyPav.touchedYa(self)
		print("vadapavready!")
