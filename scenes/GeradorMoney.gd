extends Position2D

onready var money = preload("res://scenes/Money.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	print("Gerou money")
	print(position)
	var novo_money = money.instance()
	novo_money.position = (Vector2(rand_range(-150, 100), rand_range(-100, 150)))
	print(novo_money.position)
	owner.add_child(novo_money)
