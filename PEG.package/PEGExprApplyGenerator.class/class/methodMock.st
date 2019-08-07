as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	| childResult |
	childResult := self parse{2}: string atPos: pos.
	^ childResult
		ifNil: [nil]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #apply;
				startPos: pos;
				endPos: childResult endPos;
				children: {childResult};
				yourself]'