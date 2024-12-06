extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		if (get_tree().paused):
			$PauseMenu.visible = true
		else:
			$PauseMenu.visible = false
