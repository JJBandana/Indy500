extends Area2D

@export var last_checkpoint: int = 0
@export var max_laps: int = 3
var lap: int = 1

signal crossed_line
signal finished

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Vehicle:
		if body.checkpoint == last_checkpoint:
			lap += 1
			body.checkpoint = 0
			emit_signal("crossed_line")
			if lap > max_laps:
				emit_signal("finished")
				print("FINISHED")
		print("LAP: ", lap)
