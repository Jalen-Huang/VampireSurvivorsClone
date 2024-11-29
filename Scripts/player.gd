extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

@onready var _animated_sprite = $PlayerAnimation

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("runRight")
	else:
		_animated_sprite.play("idleRight")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
