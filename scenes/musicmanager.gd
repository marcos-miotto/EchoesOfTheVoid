extends Node

@onready var audio = $AudioStreamPlayer

func play():
	if !audio.playing:
		audio.play()

func stop():
	if audio.playing:
		audio.stop()
