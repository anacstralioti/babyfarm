extends CanvasLayer

@onready var animation: AnimationPlayer = get_node("Animation")

var scene_path: String = ""
var can_quit: bool = false

# Called when the node enters the scene tree for the first time.
func fade_in() -> void:
	animation.play("fade_in")


func _on_animation_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in": #quando a animação de fade_in estiver terminando então passar para a animação de fade_out
		
		if can_quit:
			get_tree().quit()
			return
		
		get_tree().change_scene_to_file(scene_path)
		animation.play("fade_out")
