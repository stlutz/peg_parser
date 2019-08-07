as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	| char |
	char := string at: pos ifAbsent: [^ nil].
	^ (#startChar <= char and: [char <= #endChar])
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #range;
				startPos: pos;
				endPos: pos + 1;
				yourself]
		ifFalse: [nil]'