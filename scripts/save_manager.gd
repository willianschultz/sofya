## Gerenciador simples do progresso salvo.
##
## Responsável por:
## - Salvar a última fase desbloqueada em JSON.
## - Carregar essa fase ao iniciar o jogo.
## - Usar valores seguros quando não houver arquivo ou ele estiver inválido.
##
## Documentação: docs/06_SALVAMENTO.md
extends Node

const SAVE_PATH: String = "user://savegame.json"
const SAVE_VERSION: int = 1
const DEFAULT_LEVEL_PATH: String = "res://scenes/main.tscn"


func save_last_unlocked_level(level_path: String) -> void:
	var save_data: Dictionary = {
		"save_version": SAVE_VERSION,
		"last_unlocked_level_path": level_path,
	}
	var save_file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if save_file != null:
		save_file.store_string(JSON.stringify(save_data))


func load_last_unlocked_level() -> String:
	if not FileAccess.file_exists(SAVE_PATH):
		return DEFAULT_LEVEL_PATH

	var save_file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if save_file == null:
		return DEFAULT_LEVEL_PATH

	var parsed_data = JSON.parse_string(save_file.get_as_text())
	if not parsed_data is Dictionary:
		return DEFAULT_LEVEL_PATH

	var saved_version: int = int(parsed_data.get("save_version", 0))
	if saved_version > SAVE_VERSION:
		return DEFAULT_LEVEL_PATH

	var saved_level_path: String = str(parsed_data.get("last_unlocked_level_path", DEFAULT_LEVEL_PATH))
	if ResourceLoader.exists(saved_level_path):
		return saved_level_path

	return DEFAULT_LEVEL_PATH


func has_saved_progress() -> bool:
	return load_last_unlocked_level() != DEFAULT_LEVEL_PATH


func clear_progress() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)
