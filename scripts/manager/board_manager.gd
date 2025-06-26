extends Node2D

@export var floor_tile: PackedScene
@export var outer_wall_tile: PackedScene
@export var wall_tile: PackedScene
@export var oxigen_tile: PackedScene
@export var exit_tile : PackedScene
@export var enemy_tile : PackedScene
@export var boss_tile = load("res://prefabs/tiles/boss_tile.tscn")

@onready var in_game_music = $GameMusicPlayer

var column := 8
var rows := 8
var space := 32
var grid_position := []
var wall_count = Count.new(4, 8)
var oxigen_count = Count.new(1, 5)

func _ready() -> void:
	MusicPlayer.stop()
	randomize()

func _initialize_list() -> void:
	grid_position.clear()
	for x in column - 1:
		for y in rows - 1:
			grid_position.append(Vector2(x * space, y * space))
			
			
func _board_setup() -> void:
	for x in range(-1, column + 1):
		for y in range(-1, rows + 1):
			var temp
			if x == -1 || x == column || y == -1 || y == column:
				temp = outer_wall_tile.instantiate()
			else:
				temp = floor_tile.instantiate()
				
			temp.global_position = Vector2(x * space, y * space)
			add_child(temp)

func _random_position() -> Vector2:
	var random = randi_range(0, grid_position.size() - 1)
	var random_pos = grid_position[random]
	grid_position.pop_at(random)
	return random_pos

func _spawn_object_random(tile: PackedScene, minimun: int, maximun: int) -> void:
	var object_count = randi_range(minimun, maximun)
	for i in object_count:
		var tile_choice = tile.instantiate() as Node2D
		tile_choice.global_position = _random_position()
		add_child(tile_choice)
		

func _spawn_exit() -> void:
	var temp_exit = exit_tile.instantiate() as Node2D
	temp_exit.global_position = Vector2(column * space - space, rows - space / 4)
	add_child(temp_exit)

func _spawn_boss_random() -> void:
	var boss = boss_tile.instantiate() as CharacterBody2D
	boss.global_position = _random_position()
	add_child(boss)


func setup_scene(level: int) -> void:
	_initialize_list()
	_board_setup()
	if GameController.level == 10:
		_spawn_boss_random()
	else:
		var enemy_count = log(GameController.level)
		_spawn_object_random(enemy_tile, enemy_count, enemy_count)
	_spawn_object_random(wall_tile, wall_count.minimum, wall_count.maximum)
	_spawn_object_random(oxigen_tile, oxigen_count.minimum, oxigen_count.maximum)
	_spawn_exit()

class Count:
	var minimum : int
	var maximum : int
	
	func _init(_minimum: int, _maximum: int) -> void:
		minimum = _minimum
		maximum = _maximum
		
