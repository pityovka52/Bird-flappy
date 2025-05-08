extends CharacterBody2D

@export var flap_strength := -300
@export var gravity := 800

signal hit_obstacle

func _physics_process(delta):
	velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = flap_strength

	move_and_slide()

func _on_area_2d_body_entered(body):
	if "Pipe" in body.name or body.name == "Ground":
		emit_signal("hit_obstacle")
