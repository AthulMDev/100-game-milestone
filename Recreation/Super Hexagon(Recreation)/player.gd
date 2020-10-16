extends Node2D

var motion = 0
var zoom = 1.0
var timer = 1

func _process(_delta):
	$point.rotation_degrees = motion
	if Input.is_action_pressed("ui_left"): motion -= 8
	if Input.is_action_pressed("ui_right"): motion += 8
	
	$Camera2D.zoom = Vector2(zoom, zoom)
	
	timer += 1
	
	if timer < 60: timer = 0
	zoom = 1 + sin(timer *0.2) *0.02
