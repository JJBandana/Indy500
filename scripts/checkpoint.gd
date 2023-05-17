extends Area2D

@export var checkpoint_number: int = 0;

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Vehicle:
		body.checkpoint = checkpoint_number
