as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self parse_{1}: string atPos: pos.
	^ childResult
		ifNil: [
			PEGShadowAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				yourself]
		ifNotNil: [nil]'