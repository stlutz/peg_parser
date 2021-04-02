method body generation
methodBodyTemplateForString

	^ 'pos + {4} > string size ifTrue: [^ nil].
	1 to: {2} do: [:index |
		(({1} at: index) == (string at: pos + index - 1)) ifFalse: [
			self reportFailureOf: {1} atPos: pos.
			^ nil]].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + {2}
		children: #( {1} )'