method body generation
methodBodyTemplate

	^ '| char |
	pos > string size ifTrue: [^ nil].
	char := string at: pos.
	({3} <= char asInteger and: [{4} >= char asInteger]) ifFalse: [
		self reportFailureOf: \{{1} . {2}\} atPos: pos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + 1
		children: \{ char \}'