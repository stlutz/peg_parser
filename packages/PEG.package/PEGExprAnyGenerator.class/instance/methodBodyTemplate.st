method body generation
methodBodyTemplate
	^ '(pos <= string size) ifFalse: [
		self reportFailureOf: #any atPos: pos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + 1
		children: { string at: pos }'