method body generation
methodBodyTemplateForString

	self flag: #todo. "identity test for characters?"
	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	1 to: {2} do: [:index |
		(({1} at: index) == (string at: (skipPos + index - 1) ifAbsent: [nil])) ifFalse: [
			self reportFailureOf: {1} atPos: skipPos.
			^ nil]].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + {2}
		children: #( {1} )'