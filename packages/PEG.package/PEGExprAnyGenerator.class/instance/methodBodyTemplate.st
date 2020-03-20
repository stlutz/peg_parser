method body generation
methodBodyTemplate
	^ '^ (pos <= string size)
		ifTrue: [
			PEGNode newOn: #_terminal for: string from: pos to: pos + 1]
		ifFalse: [
			self reportFailureOf: #any atPos: pos.
			nil]'