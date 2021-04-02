method body generation
methodBodyTemplateForString

	self flag: #todo. "identity test for characters?"
	^ '1 to: {2} do: [:index |
		(({1} at: index) == (string at: (pos + index - 1) ifAbsent: [nil])) ifFalse: [
			self reportFailureOf: {1} atPos: pos.
			^ nil]].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + {2}
		children: #( {1} )'