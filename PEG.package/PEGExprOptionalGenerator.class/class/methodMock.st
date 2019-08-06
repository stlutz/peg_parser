as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	| childResult |
	childResult := self parse{2}: string atPos: pos.
	^ childResult
		ifNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #optional;
				startPos: pos;
				endPos: pos;
				children: {};
				yourself]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #optional;
				startPos: pos;
				endPos: childResult endPos;
				children: {childResult};
				yourself]'