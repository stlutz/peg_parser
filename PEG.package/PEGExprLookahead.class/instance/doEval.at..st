as yet unclassified
doEval: string at: pos
	| result childNode rightmostError |
	result := childExpr eval: string at: pos.
	childNode := result at: 1.
	rightmostError := result at: 2.
	^ childNode
		ifNotNil: [{
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: childNode nodeList;
				yourself .
			rightmostError}]
		ifNil: [{nil . rightmostError}]