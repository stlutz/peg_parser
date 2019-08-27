as yet unclassified
methodBodyMock
	^ '^ (memoization at: pos ifAbsent: [^ nil]) at: #{1} ifAbsentPut: [
		| skipPos childResult |
		skipPos := self skipSpaces: string atPos:pos.
		childResult := self {1}: string atPos: skipPos.
		childResult
			ifNil: [nil]
			ifNotNil: [
				PEGAbstractSyntaxTreeNode new
					rule: #apply;
					startPos: pos;
					endPos: childResult endPos;
					children: childResult nodeList;
					yourself ] ]'