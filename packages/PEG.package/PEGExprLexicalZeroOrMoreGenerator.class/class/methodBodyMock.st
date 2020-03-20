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

	^ PEGNode newOn: #_list for: string from: pos to: currentPos children: (children collect: #nodeList) flatten'