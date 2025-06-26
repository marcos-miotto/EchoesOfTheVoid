extends Node

@onready var audio = $AudioStreamPlayer

func play():
	if !audio.playing:
		audio.play()

func stop():
	if audio.playing:
		audio.stop()

func pause():
	if audio.playing:
		audio.stream_paused = true

func resume():
	if audio.stream_paused:
		audio.stream_paused = false
