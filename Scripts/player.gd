extends CharacterBody2D

@export var speed = 100

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

@onready var _animated_sprite = $PlayerAnimation

func s_process(_delta):
	pass
	#if Input.is_action_pressed("ui_up"):
		#_animated_sprite.play("walkUp")
	#else:
		#_animated_sprite.play("idleUp")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func SpawnObject():
	var MyObject = preload("res://Sprites/fireball.jpg").instance()
	$ObjectParent.add_child(MyObject)
	MyObject.global_transform.origin = Vector3(-1000, 0, 0)
	pass
