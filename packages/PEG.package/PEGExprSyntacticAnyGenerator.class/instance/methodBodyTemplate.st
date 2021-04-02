method body generation
methodBodyTemplate
	^ '| skipPos |
	(pos <= string size) ifFalse: [
		self reportFailureOf: #any atPos: pos.
		^ nil].
	
	skipPos := self skipSpaces: pos.
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + 1
		children: {string at: skipPos}'