extends Bubble

@export var refill_amount = randf_range(2.0, 10.0)

func do_behavior(entity):
	# O2 Behavior
	print(entity.Breath)
	print("BREATHE DAMN YOU!")
	entity.Breath += refill_amount
	print(entity.Breath)
	
