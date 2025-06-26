extends Node
signal killed_count_updated(value: int)

var level := 1
var health := 100
var grid_size := 32
var player : CharacterBody2D

func restart_game() -> void:
	level = 1
	health = 100
