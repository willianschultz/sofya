## Controlador de movimentação da Sofya.
##
## Responsável por:
## - Movimentação horizontal e corrida.
## - Aplicação da gravidade e salto.
## - Agachamento com verificação de espaço sobre a personagem.
##
## Cena relacionada: scenes/player.tscn
## Documentação: docs/03_MOVIMENTACAO.md
extends CharacterBody2D

@export_category("Movimentação")
@export var walk_speed: float = 180.0
@export var run_speed: float = 280.0
@export var acceleration: float = 1_400.0
@export var deceleration: float = 1_800.0
@export var jump_velocity: float = -390.0

@export_category("Agachamento")
@export var standing_height: float = 48.0
@export var crouching_height: float = 30.0

@onready var body_collision: CollisionShape2D = $CollisionShape2D
@onready var visual: Polygon2D = $Visual
@onready var head_clearance: RayCast2D = $HeadClearance

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_crouching: bool = false


func _physics_process(delta: float) -> void:
	update_crouching()
	apply_gravity(delta)
	read_movement_input(delta)
	jump_if_requested()
	move_and_slide()


func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta


func read_movement_input(delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")
	var target_speed: float = walk_speed

	if Input.is_action_pressed("run") and not is_crouching:
		target_speed = run_speed

	if direction != 0.0:
		velocity.x = move_toward(velocity.x, direction * target_speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, deceleration * delta)


func jump_if_requested() -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor() and not is_crouching:
		velocity.y = jump_velocity


func update_crouching() -> void:
	if Input.is_action_pressed("crouch"):
		set_crouching(true)
	elif not head_clearance.is_colliding():
		set_crouching(false)


func set_crouching(should_crouch: bool) -> void:
	if is_crouching == should_crouch:
		return

	is_crouching = should_crouch
	var shape: RectangleShape2D = body_collision.shape as RectangleShape2D
	var body_height: float = crouching_height if is_crouching else standing_height

	# Mantém os pés na mesma posição ao mudar a altura do corpo.
	shape.size.y = body_height
	body_collision.position.y = (standing_height - body_height) / 2.0
	visual.scale.y = body_height / standing_height
	visual.position.y = (standing_height - body_height) / 2.0
