extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	print("_input", event)


func _unhandled_input(event):
	print("_unhandled_input", event)


func _unhandled_key_input(event):
	print("_unhandled_key_input", event)


