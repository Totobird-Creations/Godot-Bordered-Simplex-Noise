extends Control



func example() -> void:
	var noise = BorderedSimplexNoise.new()
	noise.set_seed(17)
	
	# Will print either `0.0` or `1.0`.
	# This algorithm does not support interpolating it
	print(noise.get_noise_2dv(Vector2(0.0, 0.0)))

	# Has all of the methods from `OpenSimplexNoise` except for `get_noise_4d`
	noise.get_noise_3d(0.0, 8.7, 2.0)
	noise.get_noise_1d(48.9)
