extends CharacterBody2D

@export var speed = 100
@onready var scene = preload("res://Prefabs/fireball.tscn")

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	pass
	
	#if Input.is_action_pressed("ui_up"):
		#_animated_sprite.play("walkUp")
	#else:
		#_animated_sprite.play("idleUp")


func SpawnObject():
	var fireball = scene.instantiate()
	add_sibling(fireball)
	fireball.global_position = self.global_position
	fireball.look_at(get_global_mouse_position())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = get_node("AttackTimer")
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	SpawnObject()
