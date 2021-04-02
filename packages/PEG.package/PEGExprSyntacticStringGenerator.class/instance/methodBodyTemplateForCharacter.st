method body generation
methodBodyTemplateForCharacter

	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	skipPos > string size ifTrue: [^ nil].
	{3} == (string at: skipPos) ifFalse: [
		self reportFailureOf: {1} atPos: skipPos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + {2}
		children: #( {1} )'