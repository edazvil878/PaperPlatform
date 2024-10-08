extends Area2D

@onready var bandera_sprite: AnimatedSprite2D = $AnimatedSprite2D  # Asegúrate de tener un nodo AnimatedSprite2D
var game_manager: GameManager  # Referencia al GameManager
var hud: HUD  # Referencia al HUD

func _ready():
	game_manager = get_tree().get_first_node_in_group("game_manager")
	hud = get_tree().get_first_node_in_group("hud")
	
	connect("body_entered", Callable(self, "_on_body_entered"))
	bandera_sprite.play("quieta")  # Asegúrate de que la animación "quieta" esté configurada

func _on_body_entered(body: Node) -> void:
	# Verifica si el body es parte del grupo "Player"
	print("hola.")
	if body.is_in_group("Player"):
		print("El jugador ha entrado en la zona de la bandera.")
		if game_manager.score == game_manager.max_coins:
			levantar_bandera()
			hud.mostrar_mensaje("¡Victoria!")
			body.is_control_enabled = false
		else:
			hud.mostrar_mensaje("Te quedan monedas.")

func levantar_bandera():
	bandera_sprite.play("levantar")  # Reproduce la animación de levantar
