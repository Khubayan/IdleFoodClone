extends Node
class_name CustomerManager


@export var spawn_positions: Array[Marker2D]
@export var customer_sprites: Array[CustomerData]
@export var customer_scene: PackedScene




func spawn_customer() -> void:
	var customer_instance: Customer = customer_scene.instantiate()
	add_child(customer_instance)
	#Get random sprites
	var sprite_data: CustomerData = customer_sprites.pick_random()
	customer_instance.set_sprites(sprite_data)
	#Get random item and quantity
	var random_item: Item = GameManager.get_random_item()
	var random_quantity: int = randi_range(1, 3)
	customer_instance.init_customer(random_item, random_quantity)
	#Get random spawn position
	var random_spawn_pos: Marker2D = spawn_positions.pick_random()
	customer_instance.position = random_spawn_pos.position
	customer_instance.play_move_anim()
	#Move customer
	var tween: Tween = create_tween()
	tween.tween_property(customer_instance, "position", customer_instance.position + Vector2.RIGHT * 1350, 5.0)
	tween.finished.connect(func(): customer_instance.queue_free())


func _on_spawn_timer_timeout() -> void:
	spawn_customer()
