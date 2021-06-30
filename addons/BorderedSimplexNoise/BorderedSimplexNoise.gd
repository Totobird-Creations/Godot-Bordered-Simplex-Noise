tool
extends Resource
class_name BorderedSimplexNoise



export (int)             var _Seed        : int              = 0   setget set_seed
export (float, 0.0, 1.0) var persistence : float            = 1.0
export (float, 0.0, 1.0) var blobbiness  : float            = 1.0
export (float, 0.0, 1.0) var thickness   : float            = 0.2

var _noiseA                               : OpenSimplexNoise
var _noiseB                               : OpenSimplexNoise



func _init() -> void:
	_noiseA = OpenSimplexNoise.new()
	_noiseA.octaves = 3
	_noiseA.period = 64
	_noiseA.persistence = 0.5
	_noiseA.lacunarity = 2
	_noiseB = _noiseA.duplicate()



func get_image(width: int, height: int) -> Image:
	var img : Image = Image.new()
	img.create(width, height, true, Image.FORMAT_L8)

	for x in width:
		for y in height:
			if (get_noise_2d(x, y) > 0.0):
				img.lock()
				img.set_pixel(x, y, Color(1.0, 1.0, 1.0))
				img.unlock()

	return(img)



func get_noise_1d(x: float) -> float:
	return(get_noise_2d(x, 0.0))



func get_noise_2d(x: float, y: float) -> float:
	var a      : float = (_noiseA.get_noise_2d(x, y) + 1.0) / 2.0
	var b      : float = (_noiseB.get_noise_2d(x, y) + 1.0) / 2.0

	var border : float = blobbiness * 0.5

	return(float(
		a >= (1.0 - persistence) and
		b >= (1.0 - border)      and
		b <= (-2.0 * border / (thickness - 2.0))
	))



func get_noise_2dv(pos: Vector2) -> float:
	return(get_noise_2d(pos.x, pos.y))



func get_noise_3d(x: float, y: float, z: float) -> float:
	var noiseX : float = get_noise_2d(x, y)
	var noiseZ : float = get_noise_2d(z, y)

	return(float(
		noiseX and noiseZ
	))



func get_noise_3dv(pos: Vector3) -> float:
	return(get_noise_3d(pos.x, pos.y, pos.z))



func set_seed(value: int) -> void:
	_Seed = value

	_noiseA.set_seed(_Seed)
	_noiseB.set_seed(_Seed + 1)
