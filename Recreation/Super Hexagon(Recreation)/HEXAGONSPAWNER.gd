extends Node2D

export(PackedScene) var hexagon

func _on_Timer_timeout():
	var hexagoninstanced = hexagon.instance()
	add_child(hexagoninstanced)
