as yet unclassified
doEval: string at: pos
	| result childNode rightmostError |
	result := childExpr eval: string at: pos.
	childNode := result at: 1.
	rightmostError := result at: 2.
	^ childNode
		ifNil: [{
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: {};
				yourself .
			rightmostError}]
		ifNotNil: [{
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: childNode endPos;
				children: childNode nodeList;
				yourself .
			rightmostError}]