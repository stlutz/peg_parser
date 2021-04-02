method body generation
methodBodyTemplateForString

	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	skipPos + {4} > string size ifTrue: [^ nil].
	1 to: {2} do: [:index |
		(({1} at: index) == (string at: skipPos + index - 1)) ifFalse: [
			self reportFailureOf: {1} atPos: skipPos.
			^ nil]].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + {2}
		children: #( {1} )'