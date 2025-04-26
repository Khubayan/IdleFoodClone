extends Node2D

class_name Cashier


@export var move_speed := 50.0
@onready var anim_player: AnimationPlayer = $AnimationPlayer



func  move_to_custoner() -> void:
	# Create tween
	# Move
	anim_player.play("move")

func move_to_item_position() -> void:
	# Create tween
	# Move to item counter pos
	# Start cook time
	anim_player.play("idle")
