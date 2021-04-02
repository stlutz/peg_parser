method body generation
methodBodyTemplateForCharacter

	self flag: #todo. "can pos be > string size ?"
	^ '{3} == (string at: pos ifAbsent: [nil]) ifFalse: [
		self reportFailureOf: {1} atPos: pos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + {2}
		children: #( {1} )'