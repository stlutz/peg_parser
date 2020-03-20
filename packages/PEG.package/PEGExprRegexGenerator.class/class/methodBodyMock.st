as yet unclassified
methodBodyMock
	^ '| char |
	char := string at: pos ifAbsent: [^ nil].
	^ (#regexObject matches: char)
		ifTrue: [
			PEGNode newOn: #_terminal for: string from: pos to: pos + 1]
		ifFalse: [
			self reportFailureOf: #regexString atPos: pos.
			nil]'