extends Node2D

onready var motopoor = get_node("Motopoor")
export var money = 100
onready var label = get_node("font/Control/Label")

var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready():
	pass # Replace with function body.
	
func pagar_boleto():
	print("Pagou boleto")
	money -= 50
	print(money)
	label.set_text("R$ " + str(money))
	if money <= 0:
		estado = PERDENDO
		motopoor.apply_impulse(Vector2(0,0), Vector2(-4000, -4000))
		get_node("Background").stop()
	
func coletar_money():
	print("Pegou a grana")
	money += 25
	get_node("CoinSound").play()
	print(money)
	label.set_text("R$ " + str(money))