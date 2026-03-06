extends Node2D

@export var obstacle : PackedScene

var spawn_delay = 1.0
var min_delay = 0.3
var difficulty_increase = 0.05

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x += randf_range(-600, 600)

	spawned.global_position = spawn_pos

func repeat():
	while true:
		spawn()
		
		spawn_delay = max(min_delay, spawn_delay - difficulty_increase)
		
		await get_tree().create_timer(spawn_delay).timeout
