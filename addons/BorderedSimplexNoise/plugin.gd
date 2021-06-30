tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type(
		'BorderedSimplexNoise',
		'OpenSimplexNoise',
		load('res://addons/BorderedSimplexNoise/BorderedSimplexNoise.gd'),
		load('res://addons/BorderedSimplexNoise/BorderedSimplexNoise.png')
	)
	add_custom_type(
		'BorderedSimplexNoiseTexture',
		'ImageTexture',
		load('res://addons/BorderedSimplexNoise/BorderedSimplexNoiseTexture.gd'),
		load('res://addons/BorderedSimplexNoise/BorderedSimplexNoise.png')
	)


func _exit_tree() -> void:
	remove_custom_type(
		'BorderedSimplexNoise'
	)
	remove_custom_type(
		'BorderedSimplexNoiseTexture'
	)
