as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	| childResult |
	childResult := self parse{2}: string atPos: pos.
	^ childResult
		ifNil: [nil]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: {childResult};
				yourself]'