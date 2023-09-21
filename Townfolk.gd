extends CharacterBody2D

@onready var animation: AnimationPlayer = get_node("AnimationPlayer")
@onready var texture: Sprite2D = get_node("Sprite2D") 

@export var move_speed: float = 200.0


func _physics_process(delta: float) -> void:
	move()
	animate()


func move() -> void:
	var direction: Vector2 = get_direction()
	velocity = direction * move_speed 			#velocity é uma palavra reservada de caracterBody2D, que é a força linear que é aplicada a este objeto.
	move_and_slide()

#esse vertor de duas dimenções indica que o nosso personagem se locomove em duas direções (x & y) 
func get_direction() -> Vector2:
	
	return Vector2( 
		Input.get_axis("move_left", "move_right"),		 #primeiro é inserido a ação negativa, no caso a esquerda no eixo x
		Input.get_axis("move_up","move_down")
	).normalized()			#usado para q quando o pesonagem ande na diagonal ele não percorra o caminho mais rapido mas sim no tempo normal.

func animate() -> void:#aqui estamos dizendo que se a velocidade do personagem for diferente de 0 em X e Y então significa que o personagem esta andando
	if velocity.x > 0:
		texture.flip_h = false
		animation.play("Walk")
		return
	if velocity.x < 0: # Inverte o sprite horizontalmente
		texture.flip_h = true
		animation.play("Walk")
		return

	if velocity.y < 0:  # Verifica se o personagem está indo para cima (componente y negativa)
		animation.play("Walk_up")
		return
	if velocity.y > 0:
		animation.play("Walk_down")
		return
	else:
		animation.play("Idle")
		return
