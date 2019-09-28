extends Node2D

#export var velocidade = -650
onready var cena = get_tree().get_current_scene()

func _ready():
	set_process(true)
	
func _process(delta):
	if cena.estado == cena.JOGANDO:
		position = position + Vector2(rand_range(-500, -700) * delta, 0)
	if position.x < -1000:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.get_name() == "Motopoor":
		cena.coletar_money()
		queue_free()
