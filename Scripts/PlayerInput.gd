extends Node
class_name PlayerInput

@export var throttle_input: float
@export var turn_input: float
@export var shoot_input: bool

func _physics_process(_delta: float) -> void:
	throttle_input = Input.get_axis("throttle_down", "throttle_up")
	turn_input = Input.get_axis("turn_left", "turn_right")
	shoot_input = Input.is_action_pressed("shoot")
