## Controlador da tela de conclusão da demonstração.
##
## Responsável por retornar ao menu ou reiniciar a demonstração.
##
## Cena relacionada: scenes/demo_complete.tscn
## Documentação: docs/05_INTERFACE.md
extends Control


func on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func on_restart_pressed() -> void:
	SaveManager.clear_progress()
	get_tree().change_scene_to_file(SaveManager.DEFAULT_LEVEL_PATH)
