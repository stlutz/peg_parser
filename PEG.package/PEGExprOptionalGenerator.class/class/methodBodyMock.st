as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: string atPos: pos.
	^ childResult
		ifNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #optional;
				startPos: pos;
				endPos: pos;
				children: (Array new: 0);
				yourself]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #optional;
				startPos: pos;
				endPos: childResult endPos;
				children: (Array with: childResult);
				yourself]'