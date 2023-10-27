extends StaticBody2D

var selecionado = false
var seed_type = 1 #tipo da semente = milho

func _ready():
	$AnimatedSprite2D.play("default")

#função para criar um evento de selecionar com o mouse
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		Global.plantSelected = seed_type
		selecionado = true

#função para reconhecer que estou segurando o saco de semente
func _physics_process(delta):
	if selecionado:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		
#função para soltar o saco 
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selecionado = false
