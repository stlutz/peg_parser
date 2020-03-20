private
skipSpaces: pos
	| spacesResult |
	spacesResult := self apply_spaces: pos.
	^ spacesResult 
		ifNil: [pos]
		ifNotNil: [spacesResult endPos]