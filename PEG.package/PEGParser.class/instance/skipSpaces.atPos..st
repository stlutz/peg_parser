as yet unclassified
skipSpaces: string atPos: pos
	| spacesResult |
	spacesResult := self apply_spaces: string atPos: pos.
	^ spacesResult == nil
		ifTrue: [pos]
		ifFalse: [spacesResult endPos]