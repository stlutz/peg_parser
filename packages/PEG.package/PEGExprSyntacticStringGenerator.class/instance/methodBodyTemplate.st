method body generation
methodBodyTemplate
	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	#matchString withIndexDo: [:character :index |
		(character == (string at: (skipPos + index - 1) ifAbsent: [nil])) ifFalse: [
			self reportFailureOf: #matchString atPos: skipPos.
			^ nil] ].
	^ PEGNode newOn: #_terminal for: string from: skipPos to: (skipPos + #matchString size) children: {#matchString}'