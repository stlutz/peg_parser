as yet unclassified
applyMethodBodyMock
	^ '^ (memoization at: pos ifAbsent: [^ nil]) at: #{1} ifAbsentPut: [
		| childResult |
		childResult := self {1}: string atPos: pos.
		childResult
			ifNil: [nil]
			ifNotNil: [
				PEGAbstractSyntaxTreeNode new
					rule: #apply;
					startPos: pos;
					endPos: childResult endPos;
					children: (Array with: childResult);
					yourself ] ]'