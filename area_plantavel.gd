extends StaticBody2D

var plant = Global.plantSelected
var plantaCrescendo = false
var plantColhivel = false

func _physics_process(delta):
	if plantaCrescendo == false:
		plant = Global.plantSelected


func _on_area_2d_area_entered(area):
	if not plantaCrescendo:
		if plant == 1:
			plantaCrescendo = true
			$Tempo_milho.start()
			$plant.play("milho_grown")
		
		if plant == 2:
			plantaCrescendo = true
			$Tempo_tomate.start()
			$plant.play("tomate_grown")
			
	else:
		print("Planta ja esta crescendo aqui")

#passagem dos frames na tela
func _on_tempo_milho_timeout():
	var milho_plant = $plant #plant is a local variable
	if milho_plant.frame == 0:
		milho_plant.frame = 1
		$Tempo_milho.start()
	elif milho_plant.frame == 1:
		milho_plant.frame = 2
	elif milho_plant.frame == 2:
		milho_plant.frame = 3
	elif milho_plant.frame == 3:
		milho_plant.frame = 4	
		plantColhivel = true
		
func _on_tempo_tomate_timeout():
	var tomate_plant = $plant #plant is a local variable
	if tomate_plant.frame == 0:
		tomate_plant.frame = 1
		$Tempo_tomate.start()
	elif tomate_plant.frame == 1:
		tomate_plant.frame = 2
	elif tomate_plant.frame == 2:
		tomate_plant.frame = 3
	elif tomate_plant.frame == 3:
		tomate_plant.frame = 4	
		plantColhivel = true

#funcao para colher
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plantaCrescendo and plantColhivel: # Verifica se a planta está crescendo e é colhível
			if plant == 1:
				Global.numofMilho += 1
				plantaCrescendo = false
				plantColhivel = false
				$plant.play("nada")
			elif plant == 2:
				Global.numofTomate += 1
				plantaCrescendo = false
				plantColhivel = false
				$plant.play("nada")
			
			print("Quantidade de Milhos: "+ str(Global.numofMilho))
			print("Quantidade de Tomate: "+ str(Global.numofTomate))

