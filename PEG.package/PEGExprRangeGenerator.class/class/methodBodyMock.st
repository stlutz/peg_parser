as yet unclassified
methodBodyMock
	^ '| char |
	char := string at: pos ifAbsent: [^ nil].
	^ (#startChar <= char and: [char <= #endChar])
		ifTrue: [
			PEGNode newOn: #_terminal from: pos to: pos + 1]
		ifFalse: [
			self reportFailureOf: {#startChar . #endChar} atPos: pos.
			nil]'