extends StaticBody3D


@export var box_name : String

var dialogue_visible : bool
var closing_dialogue = false


# update the name label of the dialogue panel and hides it
func _ready():
	$Panel/Name.text = box_name
	dialogue_visible = false


# if the dialogue is still marked for closing call the despawn function, updates
# panel visibility
func _process(_delta):
	if closing_dialogue:
		despawn_dialogue()

	$Panel.visible = dialogue_visible


# this function runs after _unhandled_input, it checks if the dialogue panel is
# marked for closing and keeps it open, otherwise it turns the panel visible
func _on_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if closing_dialogue:
			closing_dialogue = false
		else:
			dialogue_visible = !dialogue_visible


#catches mouse button clicks and displays which button was pressed
func _on_panel_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$Panel/Button.text = "Left"
		elif event.button_index == MOUSE_BUTTON_MIDDLE:
			$Panel/Button.text = "Middle"
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			$Panel/Button.text = "Right"


# this function runs before _on_input_event, instead of hiding the dialogue 
# panel right away it marks it for closing, if _on_input_event catches the event
# the panel stays open
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and dialogue_visible:
		closing_dialogue = true


# closes the dialogue panel and resets its values
func despawn_dialogue():
	closing_dialogue = false
	dialogue_visible = false
	$Panel/Button.text = ""
