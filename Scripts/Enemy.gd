extends CharacterBody2D

@export_category("Stats")
@export var health = 10
@export var atk_dmg = 2
@export var mov_spd = 100



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	chase()
	move_and_slide()
	
func chase():
	var dir = Vector2(0,0) - self.global_position
	self.velocity = dir.normalized() * mov_spd
