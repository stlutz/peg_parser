method body generation
methodBodyTemplate
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

	^ PEGNode newOn: #_list for: string from: pos to: currentPos children: (children collect: #nodeList) flatten'