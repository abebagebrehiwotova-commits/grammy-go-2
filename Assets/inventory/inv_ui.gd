extends Control

#variable to check if inventory is open or closed
var is_open = false

#function to make sure  inventory is closed at the beginning of the game
func _ready():
	close()

#process funcion for input
#afterwards eliminated process funcion because its apparently to complicated for the entire system


func open():
	visible=true
	is_open=true


#change visibilty
func close():
	visible = false
	is_open = false

func toggle():
	if is_open:
		close()
	else:
		open()
