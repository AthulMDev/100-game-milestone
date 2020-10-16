extends Node2D

var hexagon_size = 7
var hexagon_line = 2

func _ready():
	self.rotation_degrees = rand_range(-360, 360)
	randomize()
	
func _process(_delta):
	self.scale = Vector2(hexagon_size, hexagon_size)
	$Line2D.width = hexagon_line
	
	hexagon_size -= 0.03
	if hexagon_size > 2: hexagon_line += 0.07
	if hexagon_size < 2: hexagon_line += 0.2
	
	if hexagon_size < 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "player":
		get_tree().paused = true
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().paused = false
		get_tree().reload_current_scene()
