as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	| currentPos currentResult children |
	currentPos := pos.
	children := OrderedCollection new.
	[
		currentResult := self parse{1}: string at: currentPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: childNode]
	] doWhileTrue: [(currentResult) == nil not]

	^ children size >= #minSize
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: #many;
				startPos: pos;
				endPos: currentPos;
				children: children asArray;
				yourself]
		ifFalse: [nil]'