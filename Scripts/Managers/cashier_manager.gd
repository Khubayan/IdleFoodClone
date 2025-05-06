extends Node
class_name CashierManager

@export var cashier_scene: PackedScene
@export var spawn_pos: Marker2D
@onready var counter_manager: CounterManager = %CounterManager


var cashier_array: Array[Cashier] = []


func _ready() -> void:
	GameManager.on_customer_request.connect(_on_customer_request)
	GameManager.on_spawn_new_cashier.connect(add_cashier)
	add_cashier()


func add_cashier() -> void:
	var cashier_instance: Cashier = cashier_scene.instantiate()
	cashier_instance.on_order_completed.connect(_on_order_completed)
	add_child(cashier_instance)
	cashier_instance.position = spawn_pos.position
	cashier_array.append(cashier_instance)

func _on_customer_request(customer: Customer) -> void:
	var free_cashiers: Array = cashier_array.filter(func(x: Cashier): return x.current_customer == null)
	if not free_cashiers: 
		return
		
	var random_cashier: Cashier = free_cashiers.pick_random()
	if random_cashier:
		random_cashier.set_customer(customer)
		random_cashier.take_order()

func _on_order_completed(cashier: Cashier) -> void:
	var available_customer: Customer =  counter_manager.get_first_available_customer()
	if available_customer != null:
		cashier.set_customer(available_customer)
		cashier.take_order()
	
	
