extends Position2D

onready var ladrao = preload("res://scenes/Ladrao.tscn")
onready var amanhecerTimer = get_node("DiaTimer")
onready var anoitecerTimer = get_node("NoiteTimer")
onready var geradorTimer = get_node("GeradorLadraoTimer")
onready var cena = get_tree().get_current_scene()

func _ready():
	randomize()

func _on_NoiteTimer_timeout():
	amanhecerTimer.start()
	cena.time = cena.DIA
	print("Amanheceu")


func _on_DiaTimer_timeout():
	cena.time = cena.NOITE
	anoitecerTimer.start()
	geradorTimer.start()
	print("Anoiteceu")
	gera_ladrao()


func _on_FirstDaylightTimer_timeout():
	print("Anoiteceu 1a vez")
	cena.time = cena.NOITE
	anoitecerTimer.start()
	geradorTimer.start()
	gera_ladrao()

func gera_ladrao():
	print("Gerando ladrao")
	var novo_ladrao = ladrao.instance()
	novo_ladrao.position = (Vector2(1300, 0))
	owner.add_child(novo_ladrao)

func _on_GeradorLadraoTimer_timeout():
	gera_ladrao()
	if cena.time == cena.NOITE:
		geradorTimer.start()
