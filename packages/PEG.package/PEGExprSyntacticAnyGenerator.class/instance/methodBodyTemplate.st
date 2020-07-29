method body generation
methodBodyTemplate
	^ '^ (pos <= string size)
		ifTrue: [ | skipPos |
			skipPos := self skipSpaces: pos.
			PEGNode newOn: #_terminal for: string from: skipPos to: skipPos + 1 children: {string at: skipPos}]
		ifFalse: [
			self reportFailureOf: #any atPos: pos.
			nil]'