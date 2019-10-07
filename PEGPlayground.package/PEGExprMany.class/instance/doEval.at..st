as yet unclassified
doEval: string at: pos
	| currentPos currentResult childNode childRightmostError rightmostError children |
	currentPos := pos.
	children := LinkedList new.
	[
		currentResult := childExpr eval: string at: currentPos.
		childNode := currentResult at: 1.
		childRightmostError := currentResult at: 2.
		rightmostError := self chooseRightmostError: rightmostError or: childRightmostError.

		childNode ifNotNil: [
			currentPos := childNode endPos.
			children add: childNode]
	] doWhileTrue: [(childNode == nil) not].

	^ children size >= min
		ifTrue: [
			{PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: currentPos;
				children: (children collect: #nodeList) flatten asArray;
				yourself .
			rightmostError}]
		ifFalse: [{nil . rightmostError}]