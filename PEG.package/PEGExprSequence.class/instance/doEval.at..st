as yet unclassified
doEval: string at: pos
	| currentPos currentResult childNode childRightmostError rightmostError children |
	currentPos := pos.
	children := Array new: childExprs size.
	childExprs withIndexDo: [:childExpr :index |
		currentResult := childExpr eval: string at: currentPos.
		childNode := currentResult at: 1.
		childRightmostError := currentResult at: 2.
		rightmostError := self chooseRightmostError: rightmostError or: childRightmostError.

		childNode
			ifNil: [^ {nil . rightmostError}]
			ifNotNil: [
				currentPos := childNode endPos.
				children at: index put: childNode]].
	^ {
		PEGShadowAbstractSyntaxTreeNode new
			rule: self;
			startPos: pos;
			endPos: currentPos;
			children: (children collect: #nodeList) flatten;
			yourself .
		rightmostError}