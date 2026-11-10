## Controlador de um obstáculo que causa dano.
##
## Responsável por detectar o contato da Sofya e avisar a fase.
## A regra de vidas fica na fase, para este obstáculo continuar reutilizável.
##
## Cena relacionada: scenes/hazard.tscn
## Documentação: docs/04_CRIANDO_FASES.md
extends Area2D

signal player_touched(player: CharacterBody2D)


func _ready() -> void:
	body_entered.connect(on_body_entered)


func on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_touched.emit(body)
