method body generation
methodBodyTemplate
	^ '| char skipPos |
	skipPos := self skipSpaces: pos.
	char := string at: skipPos ifAbsent: [^ nil].
	(#startChar <= char and: [char <= #endChar]) ifFalse: [
		self reportFailureOf: {#startChar . #endChar} atPos: skipPos.
		^ nil].
	
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + 1
		children: {char}'