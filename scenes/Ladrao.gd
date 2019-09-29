extends Node2D

onready var cena = get_tree().get_current_scene()
#onready var jumpAnim = get_node("LadraoJumpAnim")
var times = 0
var jump = false

func _ready():
	if cena.time == cena.DIA:
		queue_free()
	#jump = (rand_range(0,10) > 5)
	set_process(true)
	
func _process(delta):
	if cena.estado == cena.JOGANDO && cena.time == cena.NOITE:
		position = position + Vector2(-450 * delta, 0)
		#if position.x < 500 && times == 0 && jump:
			#times = 1
			#print(position.x)
			#jumpAnim.play("ladrao_jump")
	if position.x < -1200:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.get_name() == "Motopoor":
		cena.assaltado()
