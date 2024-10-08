extends Control
class_name HUD

@export var label : Label
@export var mensaje_label : Label  

func update_money(current_score: int, max_score: int):
	label.text = str(current_score) + "/" + str(max_score)

func mostrar_mensaje(texto: String):
	mensaje_label.text = texto
	mensaje_label.visible = true
	await get_tree().create_timer(3.0).timeout
	mensaje_label.visible = false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
