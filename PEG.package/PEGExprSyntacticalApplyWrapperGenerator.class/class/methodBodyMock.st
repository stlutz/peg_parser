as yet unclassified
methodBodyMock
	^ '| skipPos |
	skipPos := self skipSpaces: string atPos: pos.
	^ self {1}: string atPos: skipPos'