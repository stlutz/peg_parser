as yet unclassified
methodBodyMock
	^ '^ (pos <= string size)
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #any;
				startPos: pos;
				endPos: pos + 1;
				yourself]
		ifFalse: [nil]'