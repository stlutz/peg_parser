as yet unclassified
methodBodyMock
	^ '| skipPos currentPos currentResult children |
	currentPos := pos.
	children := OrderedCollection new.
	[
		skipPos := self skipSpaces: currentPos.
		currentResult := self {1}: skipPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult]
	] doWhileTrue: [(currentResult == nil) not].

	^ children size > 0
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #oneOrMore;
				startPos: pos;
				endPos: currentPos;
				children: (children collect: #nodeList) flatten;
				yourself]
		ifFalse: [nil]'