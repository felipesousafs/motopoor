extends Node2D

onready var motopoor = get_node("Motopoor")
export var money = 75
onready var label = get_node("font/Control/Label")
onready var perdeuImage = get_node("PerdeuImage")
onready var recordeLabel = get_node("recorde/Control/label")

var estado = 1
var time = 1
var recorde = 75

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
		perdeu()
	
func coletar_money():
	money += 25
	get_node("CoinSound").play()
	label.set_text("R$ " + str(money))
	if money > recorde:
		recorde = money

func assaltado():
	money -= (money - 25)
	get_node("PerdeuPlayBoy").play()
	if money <= 0:
		perdeu()

func perdeu():
	perdeuImage.visible = true
	recordeLabel.set_text("Score: R$ " + str(recorde))
	get_node("recorde").visible = true
	estado = PERDENDO
	motopoor.apply_impulse(Vector2(0,0), Vector2(-4000, -4000))
	get_node("Background").stop()
	get_node("TimeToRestart").start()

func _on_TimeToRestart_timeout():
	get_tree().reload_current_scene()
