as yet unclassified
doEval: string at: pos
	| currentPos currentResult children |
	currentPos := pos.
	children := LinkedList new.
	[
		currentResult := childExpr eval: string at: currentPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult]
	] doWhileTrue: [(currentResult == nil) not].

	^ children size >= min
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: currentPos;
				children: children asArray;
				yourself]
		ifFalse: [nil]