extends Node2D
@onready var PipeScene = preload("res://PipePair.tscn")
@onready var pipe_timer = $PipeTimer
@onready var bird = $Bird

func _ready():
	get_tree().paused = false
	$UI/GameOverScreen.visible = false
	pipe_timer.timeout.connect(_on_PipeTimer_timeout)
	$Bird.hit_obstacle.connect(_on_Bird_hit_obstacle)

func _on_PipeTimer_timeout():
	var pipe = PipeScene.instantiate()
	pipe.position = Vector2(600, randf_range(300, 600))
	add_child(pipe)

func _on_Bird_hit_obstacle():
	get_tree().paused = true
	$UI/GameOverScreen.visible = true

func _on_restart_pressed():
	get_tree().reload_current_scene()
	
