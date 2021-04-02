method body generation
methodBodyTemplate
	^ '| char |
	char := string at: pos ifAbsent: [^ nil].
	(#startChar <= char and: [char <= #endChar]) ifFalse: [
		self reportFailureOf: {#startChar . #endChar} atPos: pos.
		^ nil].
	^ PEGNode
		newOn: #_terminal
		for: string
		from: pos
		to: pos + 1
		children: {char}'