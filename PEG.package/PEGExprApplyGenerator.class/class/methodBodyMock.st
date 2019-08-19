as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: string atPos: pos.
	^ childResult
		ifNil: [nil]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #apply;
				startPos: pos;
				endPos: childResult endPos;
				children: (Array with: childResult);
				yourself]'