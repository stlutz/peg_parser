as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	^ (pos <= string size)
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #any;
				startPos: pos;
				endPos: pos + 1;
				yourself]
		ifFalse: [nil]'