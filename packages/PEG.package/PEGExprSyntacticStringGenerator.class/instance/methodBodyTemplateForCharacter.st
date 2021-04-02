method body generation
methodBodyTemplateForCharacter

	self flag: #todo. "can pos be > string size ?"
	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	{3} == (string at: skipPos ifAbsent: [nil]) ifFalse: [
		self reportFailureOf: {1} atPos: skipPos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + {2}
		children: #( {1} )'