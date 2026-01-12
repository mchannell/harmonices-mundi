extends Node2D

var stream_array = []
var audio_stream_player

func _ready():
	audio_stream_player = get_node("AudioStreamPlayer")
	stream_array.append(load("res://Sounds/Ab_pure.wav"))
	stream_array.append(load("res://Sounds/A_pure.wav"))
	stream_array.append(load("res://Sounds/Bb_pure.wav"))
	stream_array.append(load("res://Sounds/B_pure.wav"))
	stream_array.append(load("res://Sounds/C_pure.wav"))
	stream_array.append(load("res://Sounds/Db_pure.wav"))
	stream_array.append(load("res://Sounds/D_pure.wav"))
	stream_array.append(load("res://Sounds/Eb_pure.wav"))
	stream_array.append(load("res://Sounds/E_pure.wav"))
	stream_array.append(load("res://Sounds/F_pure.wav"))
	stream_array.append(load("res://Sounds/Gb_pure.wav"))
	stream_array.append(load("res://Sounds/G_pure.wav"))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ab"):
		audio_stream_player.stream = stream_array[0]
		audio_stream_player.play()
	if event.is_action_pressed("a"):
		audio_stream_player.stream = stream_array[1]
		audio_stream_player.play()
	if event.is_action_pressed("bb"):
		audio_stream_player.stream = stream_array[2]
		audio_stream_player.play()
	if event.is_action_pressed("b"):
		audio_stream_player.stream = stream_array[3]
		audio_stream_player.play()
	if event.is_action_pressed("c"):
		audio_stream_player.stream = stream_array[4]
		audio_stream_player.play()
	if event.is_action_pressed("db"):
		audio_stream_player.stream = stream_array[5]
		audio_stream_player.play()
	if event.is_action_pressed("d"):
		audio_stream_player.stream = stream_array[6]
		audio_stream_player.play()
	if event.is_action_pressed("eb"):
		audio_stream_player.stream = stream_array[7]
		audio_stream_player.play()
	if event.is_action_pressed("e"):
		audio_stream_player.stream = stream_array[8]
		audio_stream_player.play()
	if event.is_action_pressed("f"):
		audio_stream_player.stream = stream_array[9]
		audio_stream_player.play()
	if event.is_action_pressed("gb"):
		audio_stream_player.stream = stream_array[10]
		audio_stream_player.play()
	if event.is_action_pressed("g"):
		audio_stream_player.stream = stream_array[11]
		audio_stream_player.play()
		
func play_pitch(pitch: Types.Pitch) -> void:
	audio_stream_player.stream = stream_array[pitch]
	audio_stream_player.play()
