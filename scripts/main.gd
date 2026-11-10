## Controlador da primeira cena do jogo.
##
## Responsável por abrir a última fase desbloqueada quando houver um salvamento.
##
## Cena relacionada: scenes/main.tscn
## Documentação: docs/06_SALVAMENTO.md
extends Node2D


func _ready() -> void:
	var last_level_path: String = SaveManager.load_last_unlocked_level()

	if last_level_path != scene_file_path:
		get_tree().change_scene_to_file(last_level_path)
