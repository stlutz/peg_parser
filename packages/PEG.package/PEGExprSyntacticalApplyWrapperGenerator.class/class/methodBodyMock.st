as yet unclassified
methodBodyMock
	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	^ self {1}: skipPos'