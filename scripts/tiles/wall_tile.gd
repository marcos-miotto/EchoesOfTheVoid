extends StaticBody2D

var resistence := 1
var index_animation : int
var wall : Array = ["01", "02", "03", "04", "05", "06"]

func _ready() -> void:
	randomize()
	index_animation = randi() % wall.size()
	$sprite_idle.play(wall[index_animation])
	
func apply_damage() -> void:
	resistence -= 1
	
	if resistence <= 0:
		queue_free()
	
