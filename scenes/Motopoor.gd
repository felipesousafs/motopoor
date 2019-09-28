extends RigidBody2D

var touch_count = 0
onready var jump_anim = get_node("AnimationPlayer")

func _ready():
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("touch") && touch_count < 2:
		on_touch()
		touch_count += 1
		
func on_touch():
	apply_impulse(Vector2(0,0), Vector2(0, -700 + (touch_count*230)))
	if touch_count == 1 && position.y > 370:
		print("Position y: " + str(position.y))
		jump_anim.play("jump")
	

func _on_chao_body_entered(body):
	if body.name == "Motopoor":
		touch_count = 0
