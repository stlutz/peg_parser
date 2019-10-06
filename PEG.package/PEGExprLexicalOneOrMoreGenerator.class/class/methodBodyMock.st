as yet unclassified
methodBodyMock
	^ '| currentPos currentResult children |
	currentPos := pos.
	children := OrderedCollection new.
	[
		currentResult := self {1}: currentPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult]
	] doWhileTrue: [(currentResult == nil) not].

	^ children size > 0
		ifTrue: [
			PEGNode newOn: #_list from: pos to: currentPos children: (children collect: #nodeList) flatten]
		ifFalse: [nil]'