method body generation
methodBodyTemplateForCharacter

	^ 'pos > string size ifTrue: [^ nil].
	{3} == (string at: pos) ifFalse: [
		self reportFailureOf: {1} atPos: pos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + {2}
		children: #( {1} )'