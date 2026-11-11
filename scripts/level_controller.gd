## Controlador comum das fases jogáveis do SOFYA.
##
## Responsável por:
## - Contar itens coletados e liberar a saída.
## - Exibir objetivo e vidas.
## - Aplicar dano de obstáculos e inimigos.
##
## Cena relacionada: scenes/main.tscn e scenes/level_02.tscn
## Documentação: docs/02_ESTRUTURA_PROJETO.md
extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var level_exit = $Exit
@onready var objective_label: Label = $Interface/Objective
@onready var health_label: Label = $Interface/Health

var collectibles: Array[Node] = []


func _ready() -> void:
	for child in get_children():
		if child.is_in_group("collectible"):
			collectibles.append(child)
			child.connect(&"collected", on_collectible_collected)
		elif child.is_in_group("damage_source"):
			child.connect(&"player_touched", on_damage_source_player_touched)

	update_objective()
	update_health()


func on_collectible_collected() -> void:
	if collected_count() >= collectibles.size():
		level_exit.unlock()

	update_objective()


func collected_count() -> int:
	var total: int = 0

	for collectible in collectibles:
		if collectible.get("has_been_collected"):
			total += 1

	return total


func update_objective() -> void:
	if collectibles.is_empty():
		objective_label.text = "Objetivo: alcance o portal."
		return

	var count: int = collected_count()
	if count >= collectibles.size():
		objective_label.text = "Objetivo concluído: portal liberado."
	else:
		objective_label.text = "Estrelas coletadas: %d/%d" % [count, collectibles.size()]


func on_damage_source_player_touched(hit_player: CharacterBody2D) -> void:
	if hit_player != player:
		return

	player.take_damage()
	update_health()

	if player.current_health == 0:
		get_tree().reload_current_scene()
	else:
		player.respawn()


func update_health() -> void:
	health_label.text = "Vidas: %d/%d" % [player.current_health, player.max_health]
