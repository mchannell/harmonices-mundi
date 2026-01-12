class_name Types

enum Pitch {Ab, A, Bb, B, C, Db, D, Eb, E, F, Gb, G}

static func pitch_to_color(pitch: Pitch) -> Color:
	match pitch:
		Pitch.Ab:
			#return Color.INDIGO
			return Color.MAGENTA
		Pitch.A:
			#return Color.YELLOW
			return Color.RED
		Pitch.Bb:
			#return Color.DARK_MAGENTA
			return Color.CORAL
		Pitch.B:
			#return Color.GREEN
			return Color.ORANGE
		Pitch.C:
			#return Color.RED
			return Color.YELLOW
		Pitch.Db:
			#return Color.BLUE
			return Color.YELLOW_GREEN
		Pitch.D:
			#return Color.ORANGE
			return Color.GREEN
		Pitch.Eb:
			#return Color.DARK_VIOLET
			return Color.TEAL
		Pitch.E:
			#return Color.YELLOW_GREEN
			return Color.BLUE
		Pitch.F:
			#return Color.MAGENTA
			return Color.INDIGO
		Pitch.Gb:
			#return Color.TEAL
			return Color.DARK_VIOLET
		Pitch.G:
			#return Color.CORAL
			return Color.DARK_MAGENTA
	return Color.WHITE
