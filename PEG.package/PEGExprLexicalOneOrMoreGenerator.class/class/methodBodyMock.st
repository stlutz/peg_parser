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
	] doWhileTrue: [currentResult notNil].

	^ children size > 0
		ifTrue: [
			PEGNode newOn: #_list for: string from: pos to: currentPos - 1 children: (children collect: #nodeList) flatten]
		ifFalse: [nil]'