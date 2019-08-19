as yet unclassified
methodBodyMock
	^ '| currentPos currentResult children |
	currentPos := pos.
	children := OrderedCollection new.
	[
		currentResult := self {1}: string atPos: currentPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: childNode]
	] doWhileTrue: [(currentResult == nil) not].

	^ children size >= #minSize
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #many;
				startPos: pos;
				endPos: currentPos;
				children: children asArray;
				yourself]
		ifFalse: [nil]'