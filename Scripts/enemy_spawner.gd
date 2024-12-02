extends Node2D

@onready var scene = preload("res://Prefabs/enemy.tscn")
@onready var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var spawn = scene.instantiate()
	add_child(spawn)
	var angle = rng.randf_range(0,TAU)
	var disat = rng.randf_range(0,0)

	spawn.global_position = Vector2(0,0) + Vector2()
