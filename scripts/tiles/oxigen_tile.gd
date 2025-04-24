extends Area2D

@export var sfx_oxigen : Array
@export var sfx_health : Array

var oxigen := 8
var life_temp : int
var life : Array = ["01", "02"]

@onready var audio_stream_player : AudioStreamPlayer = $audio_stream_player

func _ready() -> void:
	randomize()
	life_temp = randi() % life.size()
	$animated_sprite.play(life[life_temp])


func _on_body_entered(body: Node2D) -> void:
	if body.name.match("player"):
		body.restore_hp(oxigen)
		$collision.queue_free()
		_play_sound()
		
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2.ONE * 1.1, .5)
		tween.tween_property($animated_sprite, "modulate:a", 0, .5).set_delay(.2)
		
		await  tween.finished
		queue_free()
		

func _play_sound() -> void:
	match life_temp:
		0: audio_stream_player.stream = sfx_oxigen[randi() % sfx_oxigen.size()]
		1: audio_stream_player.stream = sfx_health[randi() % sfx_health.size()]
		
	audio_stream_player.play()
	
