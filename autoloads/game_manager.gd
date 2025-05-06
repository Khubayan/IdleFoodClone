extends Node

signal on_customer_request(customer: Customer)
signal on_customer_order_completed(customer: Customer)
signal on_spawn_new_cashier


@export var item_coffee: Item
@export var item_burger: Item


const COIN_VFX = preload("res://Scenes/VFX/coin_vfx.tscn")

var coffee_counter_pos := Vector2(415, 1250)
var burger_counter_pos := Vector2(665, 1250)

var current_coins: int = 1000000

func play_coin_vfx(spawn_pos: Vector2) -> void:
	var coin_instance: GPUParticles2D = COIN_VFX.instantiate()
	get_tree().root.add_child(coin_instance)
	SoundManager.play_coins()
	var new_pos: Vector2 = Vector2(spawn_pos.x, spawn_pos.y - 50)
	coin_instance.global_position = new_pos
	coin_instance.emitting = true
	coin_instance.finished.connect(func(): coin_instance.queue_free())


func get_random_item() -> Item:
	var items: Array = [item_burger, item_coffee]
	return items.pick_random()

func get_item_counter_pos(item: Item) -> Vector2:
	match item.type:
		Item.ItemType.Coffee:
			return coffee_counter_pos
		Item.ItemType.Burger:
			return burger_counter_pos
	return Vector2.ZERO
