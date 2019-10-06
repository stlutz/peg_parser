as yet unclassified
methodBodyMock
	^ '^ (pos <= string size)
		ifTrue: [
			PEGNode newOn: #_terminal from: pos to: pos + 1]
		ifFalse: [
			self reportFailureOf: #any atPos: pos.
			nil]'