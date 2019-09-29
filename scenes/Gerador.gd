extends Position2D

onready var cena = get_tree().get_current_scene()
onready var boleto = preload("res://scenes/Boleto.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if cena.estado == cena.JOGANDO:
		var novo_boleto = boleto.instance()
		novo_boleto.position = (Vector2(100, rand_range(-80, 80)))
		owner.add_child(novo_boleto)
