tool
extends ImageTexture
class_name BorderedSimplexNoiseTexture, 'res://addons/BorderedSimplexNoise/BorderedSimplexNoise.png'



var                          noise        : BorderedSimplexNoise

export (int)             var Seed         : int                  = 0     setget set_seed
export (float, 0.0, 1.0) var persistence  : float                = 1.0
export (float, 0.0, 1.0) var blobbiness   : float                = 1.0
export (float, 0.0, 1.0) var thickness    : float                = 0.5

export (bool)            var update_image : bool                 = false setget set_update_image



func _init() -> void:
	noise = BorderedSimplexNoise.new()

	update_image()



func update_image() -> void:
	noise._Seed        = Seed
	noise.persistence  = persistence
	noise.blobbiness   = blobbiness
	noise.thickness    = thickness

	create_from_image(noise.get_image(get_width(), get_height()))



func set_seed(value: int) -> void:
	Seed = value



func set_update_image(value: bool) -> void:
	update_image = false
	update_image()
