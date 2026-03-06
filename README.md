1. Membuat Scene Level 2
2. Bikin Child TileMapLayer
3. Memilih tileset stone
4. Paint kolisi tiap tile sesuai bentuknya
5. Memilih base tile pada TileMap sesuai keinginan saya, lalu mendesign level 2
6. Posisikan player ke level 2
7. Posisikan Goal Game
8. Bikin Slime scene berisi collision shape dan sprite2d
9. Bikin spawner slime dengan script yang sedikit berbeda berbeda
```python
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

```
10. Karena ada 2 lantai jadi saya posisikan 2 spawner pada level
11. Saya menambahkan script dan signal pada LoseScreen sehingga saat mouse klik kiri pada game reset ke level 1
```python
extends Area2D
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			get_tree().change_scene_to_file("res://scenes/Level1.tscn")
```
12. Saya juga menambahkan area fall, jadi saat player jatuh maka pindah ke LoseScreen