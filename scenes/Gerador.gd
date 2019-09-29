extends Position2D

onready var boleto = preload("res://scenes/Boleto.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	var novo_boleto = boleto.instance()
	novo_boleto.position = (Vector2(100, rand_range(-80, 80)))
	owner.add_child(novo_boleto)
