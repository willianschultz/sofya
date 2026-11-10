## Controlador de um item coletável simples.
##
## Responsável por:
## - Detectar quando a Sofya toca o item.
## - Emitir um sinal para a fase atualizar seu objetivo.
## - Remover o item depois de coletado.
##
## Cena relacionada: scenes/collectible.tscn
## Documentação: docs/04_CRIANDO_FASES.md
extends Area2D

signal collected

var has_been_collected: bool = false


func _ready() -> void:
	body_entered.connect(on_body_entered)


func on_body_entered(body: Node2D) -> void:
	if has_been_collected or not body is CharacterBody2D:
		return

	has_been_collected = true
	collected.emit()
	set_deferred("monitoring", false)
	visible = false
