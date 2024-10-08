extends Node
class_name GameManager

var score = 0
var max_coins
var hud : HUD

func _ready():
	hud = get_tree().get_first_node_in_group("hud")
	
	var coin_nodes = get_tree().get_nodes_in_group("coin")
	max_coins = coin_nodes.size()
	
	hud.update_money(score, max_coins)

func add_point():
	score += 1
	hud.update_money(score, max_coins)
