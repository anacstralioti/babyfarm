extends Control
	
func _ready()-> void:
	for button in get_tree().get_nodes_in_group("button"):
		button.pressed.connect(on_button_pressed.bind(button.name))
		
#func on_button_pressed(button_name: String) -> void:
	#match button_name:
		#"NewGame":
			#TransitionScreen.scene_path = "res://level.tscn"
			#TransitionScreen.fade_in()

func on_button_pressed(button_name: String) -> void:
	match button_name:
		"jogar":
			TransitionScreen.scene_path = "res://level.tscn"
			TransitionScreen.fade_in()
			
		
		"fechar":
			TransitionScreen.can_quit = true
			TransitionScreen.fade_in()
