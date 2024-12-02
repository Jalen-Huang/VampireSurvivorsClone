extends CharacterBody2D

@export var speed = 100
@onready var scene = preload("res://Prefabs/fireball.tscn")
@onready var skillScene1 = preload ("res://Prefabs/skill1.tscn")

var canSkill1 = true
var canSkill2 = true
var canSkill3 = true

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("Skill1"):
		skill_action(skillScene1, $SkillTimer1, canSkill1, 1)
	
	elif Input.is_action_just_pressed("Skill2"):
		skill_action(skillScene1, $SkillTimer2, canSkill2, 2)
		
	elif Input.is_action_just_pressed("Skill3"):
		skill_action(skillScene1, $SkillTimer3, canSkill3, 3)

func skill_action(skillScene, skillTimer, canSkill, skillCase):
	if (canSkill):
		var skill = skillScene.instantiate()
		add_sibling(skill)
		skill.global_position = self.global_position
		skill.look_at(get_global_mouse_position())
		skillTimer.start()
		match skillCase:
			1:
				set_canSkill1(false)
			2: 
				set_canSkill2(false)
			3:
				set_canSkill3(false)
			


func SpawnObject(object):
	var fireball = scene.instantiate()
	add_sibling(fireball)
	fireball.global_position = self.global_position
	fireball.look_at(get_global_mouse_position())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var attackTimer = get_node("AttackTimer")
	var skillTimer1 = get_node("SkillTimer1")
	var skillTimer2 = get_node("SkillTimer2")
	var skillTimer3 = get_node("SkillTimer3")
	attackTimer.timeout.connect(_on_attackTimer_timeout)
	skillTimer1.timeout.connect(_on_skill1Timer_timeout)
	skillTimer2.timeout.connect(_on_skill2Timer_timeout)
	skillTimer3.timeout.connect(_on_skill3Timer_timeout)

func _on_attackTimer_timeout():
	#SpawnObject()
	pass
	
func _on_skill1Timer_timeout():
	canSkill1 = true
	
func _on_skill2Timer_timeout():
	canSkill2 = true
	
func _on_skill3Timer_timeout():
	canSkill3 = true

func set_canSkill1(canSkill):
	canSkill1 = canSkill

func set_canSkill2(canSkill):
	canSkill2 = canSkill
	
func set_canSkill3(canSkill):
	canSkill3 = canSkill
