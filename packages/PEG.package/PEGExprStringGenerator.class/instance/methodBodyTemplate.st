method body generation
methodBodyTemplate

	^ '1 "This is a temporary fix to prevent the Squeak parser to break". 
	#matchString withIndexDo: [:character :index |
		(character == (string at: (pos + index - 1) ifAbsent: [nil])) ifFalse: [
			self reportFailureOf: #matchString atPos: pos.
			^ nil] ].
	^ PEGNode newOn: #_terminal for: string from: pos to: (pos + #matchString size) children: {#matchString}'