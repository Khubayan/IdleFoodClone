extends Node

signal on_customer_request(customer: Customer)
signal on_customer_order_completed(customer: Customer)

const ITEM_BURGER = preload("res://Data/item_burger.tres")
const ITEM_COFFE = preload("res://Data/item_coffe.tres")
const COIN_VFX = preload("res://Scenes/VFX/coin_vfx.tscn")

var coffee_counter_pos := Vector2(415, 1250)
var burger_counter_pos := Vector2(665, 1250)

var current_coins: int = 0

func play_coin_vfx(spawn_pos: Vector2) -> void:
	var coin_instance: GPUParticles2D = COIN_VFX.instantiate()
	get_tree().root.add_child(coin_instance)
	var new_pos: Vector2 = Vector2(spawn_pos.x, spawn_pos.y - 50)
	coin_instance.global_position = new_pos
	coin_instance.emitting = true
	coin_instance.finished.connect(func(): coin_instance.queue_free())


func get_random_item() -> Item:
	var items: Array = [ITEM_BURGER, ITEM_COFFE]
	return items.pick_random()

func get_item_counter_pos(item: Item) -> Vector2:
	match item.type:
		Item.ItemType.Coffee:
			return coffee_counter_pos
		Item.ItemType.Burger:
			return burger_counter_pos
	return Vector2.ZERO
