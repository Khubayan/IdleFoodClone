extends Node

signal on_customer_request(customer: Customer)

const ITEM_BURGER = preload("res://Data/item_burger.tres")
const ITEM_COFFE = preload("res://Data/item_coffe.tres")

var coffee_counter_pos := Vector2(415, 1250)
var burger_counter_pos := Vector2(665, 1250)

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
