extends Node

const ITEM_BURGER = preload("res://Data/item_burger.tres")
const ITEM_COFFE = preload("res://Data/item_coffe.tres")

func get_random_item() -> Item:
	var items: Array = [ITEM_BURGER, ITEM_COFFE]
	return items.pick_random()
