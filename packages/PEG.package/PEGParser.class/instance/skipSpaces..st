private
skipSpaces: pos
	(self apply_spaces: pos)
		ifNil: [^ pos]
		ifNotNil: [:result | ^ result endPos]