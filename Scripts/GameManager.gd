extends Node
class_name GameManager

var players: Array[Player]
var local_player: Player
var score_to_win: int = 3

# Border locations for wrapping around
var border_min_x: float = -400
var border_max_x: float = 400
var border_min_y: float = -230
var border_max_y: float = 230

@onready var end_screen: Panel = $"../EndScreen"
@onready var win_text: Label = $"../EndScreen/WinText"
@onready var play_again_button: Button = $"../EndScreen/PlayAgainButton"
@onready var camera: Camera = $"../Camera2D"

# SoundFX
const PLANE_EXPLODE = preload("uid://cs54j3q23irur")
const PLANE_HIT = preload("uid://b5mmqnrs07h81")
const PLANE_SHOOT = preload("uid://doo3isbmwgwtt")

func on_player_die(player_id: int, attacker_id: int) -> void:
	var player: Player = get_player(player_id)
	var attacker: Player = get_player(attacker_id)
	
	attacker.increase_score(1)
	
	if attacker.score >= score_to_win:
		end_game(attacker.player_name)
		

func get_player(player_id: int) -> Player:
	for player in players:
		if player.player_id == player_id:
			return player
	
	return null

func reset_game() -> void:
	for player in players:
		player.respawn()
		player.score = 0
	reset_game_ui()

func reset_game_ui() -> void:
	end_screen.visible = false

func end_game(winner_name: String) -> void:
	end_screen.visible = true
	win_text.text = str(winner_name, " has won!")
	play_again_button.visible = true

func _on_play_again_button_pressed() -> void:
	reset_game()
