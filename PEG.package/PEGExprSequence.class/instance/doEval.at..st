as yet unclassified
doEval: string at: pos
	| currentPos currentResult children |
	currentPos := pos.
	children := Array new: childExprs size.
	childExprs withIndexDo: [:childExpr :index |
		currentResult := childExpr eval: string at: currentPos.
		currentResult
			ifNil: [^ nil]
			ifNotNil: [
				currentPos := currentResult endPos.
				children at: index put: currentResult]].
	^ PEGShadowAbstractSyntaxTreeNode new
		rule: self;
		startPos: pos;
		endPos: currentPos;
		children: (children collect: #nodeList) flatten;
		yourself