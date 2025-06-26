# boss_intro.gd
extends CanvasLayer

@onready var video = $VideoStreamPlayer

func _ready():
	if video:
		video.play()
		video.finished.connect(_on_video_finished)
	else:
		print("Erro: Node 'VideoStreamPlayer' não encontrado!")

func _on_video_finished():
	print("Vídeo da intro do chefe terminou. Retornando ao jogo.")
	
	# 1. Define the path to your main game scene (the one that calls setup_scene)
	#    *** IMPORTANT: Replace this with the actual path to your main game scene file. ***
	var main_game_scene_path = "res://scenes/your_main_game_scene.tscn" 
	
	# 2. Load the PackedScene resource
	var main_game_packed_scene = load(main_game_scene_path)
	
	if main_game_packed_scene:
		# 3. Change to the main game scene
		get_tree().change_scene_to_packed(main_game_packed_scene)
		
		# 4. Set a flag in your GameController singleton to indicate that the boss should be spawned
		#    This flag will be checked in the _ready() of your main game scene's script.
		if GameController: # Ensure GameController exists and is a singleton
			GameController.should_spawn_boss_after_intro = true
		else:
			print("Erro: Singleton 'GameController' não encontrado para sinalizar spawn do chefe.")
	else:
		print("Erro: Não foi possível carregar a cena do jogo principal em: {main_game_scene_path}")
