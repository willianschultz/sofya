## Controlador da primeira cena do jogo.
##
## Responsável por abrir a última fase desbloqueada quando houver um salvamento.
##
## Cena relacionada: scenes/main.tscn
## Documentação: docs/06_SALVAMENTO.md
extends Node2D

@onready var level_exit = $Exit
@onready var objective_label: Label = $Interface/Objective
@onready var health_label: Label = $Interface/Health
@onready var hazard = $Hazard

var collectibles: Array = []
var collected_count: int = 0


func _ready() -> void:
	var last_level_path: String = SaveManager.load_last_unlocked_level()

	if last_level_path != scene_file_path:
		get_tree().change_scene_to_file(last_level_path)
		return

	collectibles = [$CollectibleOne, $CollectibleTwo, $CollectibleThree]
	for collectible in collectibles:
		collectible.collected.connect(on_collectible_collected)

	hazard.player_touched.connect(on_hazard_player_touched)

	update_objective()
	update_health()


func on_collectible_collected() -> void:
	collected_count += 1

	if collected_count >= collectibles.size():
		level_exit.unlock()

	update_objective()


func update_objective() -> void:
	if collected_count >= collectibles.size():
		objective_label.text = "Objetivo concluído: portal liberado."
	else:
		objective_label.text = "Estrelas coletadas: %d/%d" % [collected_count, collectibles.size()]


func on_hazard_player_touched(hit_player: CharacterBody2D) -> void:
	if hit_player != $Player:
		return

	$Player.take_damage()
	update_health()

	if $Player.current_health == 0:
		get_tree().reload_current_scene()
	else:
		$Player.respawn()


func update_health() -> void:
	health_label.text = "Vidas: %d/%d" % [$Player.current_health, $Player.max_health]
