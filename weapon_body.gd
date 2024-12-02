extends CharacterBody2D

const SPEED = 2

func _ready():
	pass
	
func _physics_process(delta):
	velocity.x = SPEED + delta
	translate(velocity)

#func _on_VisibilityNotifier2D_screen_exited():
	#queue_free()
