class_name Types

enum Pitch {Ab, A, Bb, B, C, Db, D, Eb, E, F, Gb, G}

static func pitch_to_color(pitch: Pitch) -> Color:
	match pitch:
		Pitch.Ab:
			return Color.MAGENTA
		Pitch.A:
			return Color.RED
		Pitch.Bb:
			return Color.CORAL
		Pitch.B:
			return Color.ORANGE
		Pitch.C:
			return Color.YELLOW
		Pitch.Db:
			return Color.YELLOW_GREEN
		Pitch.D:
			return Color.GREEN
		Pitch.Eb:
			return Color.TEAL
		Pitch.E:
			return Color.BLUE
		Pitch.F:
			return Color.INDIGO
		Pitch.Gb:
			return Color.PURPLE
		Pitch.G:
			return Color.VIOLET
	return Color.WHITE

static func pitch_to_sound(pitch: Pitch) -> void:
	
	pass
