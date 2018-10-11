extends RigidBody2D

func _on_Ball_body_entered(body):
	if body.is_in_group("Blocks"):
		body.queue_free()
