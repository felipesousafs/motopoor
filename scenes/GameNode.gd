extends Node2D

onready var motopoor = get_node("Motopoor")
export var money = 100
onready var label = get_node("font/Control/Label")

var estado = 1
var time = 1

const JOGANDO = 1
const PERDENDO = 2
const DIA = 1
const NOITE = 2

func _ready():
	pass # Replace with function body.
	
func pagar_boleto():
	money -= 50
	label.set_text("R$ " + str(money))
	get_node("PagueOqueDeve").play()
	if money <= 0:
		estado = PERDENDO
		motopoor.apply_impulse(Vector2(0,0), Vector2(-4000, -4000))
		get_node("Background").stop()
	
func coletar_money():
	money += 25
	get_node("CoinSound").play()
	label.set_text("R$ " + str(money))

func assaltado():
	get_node("PerdeuPlayBoy").play()
