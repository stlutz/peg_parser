as yet unclassified
skipSpaces: string atPos: pos
	| spacesResult |
	spacesResult := self apply_spaces: string atPos: pos.
	^ spacesResult 
		ifNil: [pos]
		ifNotNil: [spacesResult endPos]