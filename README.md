# Bordered Simplex Noise (1.0)
Algorithm for generating cave-like noise. Adds `BorderedSimplexNoiseTexture` and `BorderedSimplexNoise` objects.



---

### Examples
```gdscript
func getChunk_rivers(position: Vector2) -> Dictionary:
	var ground = []
	var deco = []
	for x in range(16):
		ground.append([])
		deco.append([])
		for y in range(16):
			var vec = Vector2(position.x + x, position.y + y)
			var value = riverNoise.get_noise_2dv(vec)
			if (value > 0.0):
				value = 1
			else:
				value = 0
			ground[-1].append(value)
			deco[-1].append(-1)

	return({
		'ground' : ground,
		'deco'   : deco
	})
```
![Rivers Generator](https://raw.githubusercontent.com/toto-bird/Godot-Bordered-Simplex-Noise/master/.gdignore/screenshot_rivers.png)

---

```gdscript
func getChunk_caves(position: Vector2) -> Dictionary:
	var ground = []
	var deco = []
	for x in range(16):
		ground.append([])
		deco.append([])
		for y in range(16):
			var vec = Vector2(position.x + x, position.y + y)
			var value = caveNoise.get_noise_2dv(vec)
			var val_ground = 2
			var val_deco   = -1
			if (value == 0.0):
				val_deco = 0
			elif (underwaterLakeNoise.get_noise_2dv(vec) <= underwaterLakeThreshold):
				val_ground = 3
			ground[-1].append(val_ground)
			deco[-1].append(val_deco)

	return({
		'ground' : ground,
		'deco'   : deco
	})
```
![Caves Generator](https://raw.githubusercontent.com/toto-bird/Godot-Bordered-Simplex-Noise/master/.gdignore/screenshot_caves.png)

---
`BorderedSimplexNoiseTexture`
![Texture Generator](https://raw.githubusercontent.com/toto-bird/Godot-Bordered-Simplex-Noise/master/.gdignore/screenshot_texture.png)
