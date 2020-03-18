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
			PEGNode newOn: #_list for: string  from: pos to: currentPos children: (children collect: #nodeList) flatten]
		ifFalse: [nil]'