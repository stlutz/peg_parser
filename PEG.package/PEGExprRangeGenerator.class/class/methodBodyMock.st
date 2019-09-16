as yet unclassified
methodBodyMock
	^ '| char |
	char := string at: pos ifAbsent: [^ nil].
	^ (#startChar <= char and: [char <= #endChar])
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #range;
				startPos: pos;
				endPos: pos + 1;
				yourself]
		ifFalse: [
			self reportFailureOf: {#startChar . #endChar} atPos: pos.
			nil]'