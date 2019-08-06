as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	| childResult |
	childResult := self parse{2}: string atPos: pos.
	^ childResult
		ifNil: [
			PEGShadowAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;;
				yourself]
		ifNotNil: [nil]'