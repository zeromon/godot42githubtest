extends Node2D

var obj:CharacterBody2D

@export var speed:float = 1
## next object name
@export var next_object_name:NodePath = "object2"
## add penanda aktif object 
func _ready():
	obj = get_child(0) as CharacterBody2D
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		obj.move_and_collide(Vector2.LEFT*speed*delta)
	if Input.is_action_pressed("ui_right"):
		obj.move_and_collide(Vector2.RIGHT*speed*delta)
	if Input.is_action_just_pressed("ui_accept"):
		switch_control()


func switch_control():
	var parent = get_parent()
	print("next obj before change "+str(next_object_name))
	var next_node = parent.get_node(next_object_name)
	next_object_name = NodePath(obj.name)
	obj.reparent(parent)
	next_node.reparent(self)
	obj = get_child(0) as CharacterBody2D
	print("next obj after change "+str(next_object_name))
	parent.print_tree()
	pass
