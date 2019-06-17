as yet unclassified
doEval: string at: pos
	| currentPos currentResult children |
	currentPos := pos.
	children := LinkedList new.
	childExprs do: [:childExpr |
		currentResult := childExpr eval: string at: currentPos.
		currentResult == nil
			ifTrue: [^ nil]
			ifFalse: [
				currentPos := currentResult endPos.
				children add: currentResult]].
	^ PEGAbstractSyntaxTreeNode new
		rule: self;
		startPos: pos;
		endPos: currentPos;
		children: children;
		yourself