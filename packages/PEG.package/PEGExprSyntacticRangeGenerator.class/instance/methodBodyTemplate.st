method body generation
methodBodyTemplate

	^ '| char skipPos |
	skipPos := self skipSpaces: pos.
	skipPos > string size ifTrue: [^ nil].
	char := string at: skipPos.
	({3} <= char asInteger and: [{4} >= char asInteger]) ifFalse: [
		self reportFailureOf: \{{1} . {2}\} atPos: skipPos.
		^ nil].
	
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + 1
		children: \{ char \}'