as yet unclassified
doEval: string at: pos
	| result childNode childRightmostError rightmostError |
	childExprs do: [:childExpr |
		result := childExpr eval: string at: pos.
		childNode := result at: 1.
		childRightmostError := result at: 2.
		rightmostError := self chooseRightmostError: rightmostError or: childRightmostError.

		childNode ifNotNil: [^ {
			PEGShadowAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: childNode endPos;
				children: childNode nodeList;
				yourself .
			rightmostError}]].
	^ {nil . rightmostError}