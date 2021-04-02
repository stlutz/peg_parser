method body generation
methodBodyTemplateForArity1
	self flag: #todo. "can children have an empty nodeList?"
	^ '| currentPos children |
	currentPos := pos.
	children := OrderedCollection new.
	[
		(self {1}: currentPos)
			ifNil: [false]
			ifNotNil: [:currentResult |
				currentPos := currentResult endPos.
				children add: (currentResult nodeList at: 1).
				true]
	] whileTrue.

	^ PEGShadowNode 
		newOn: #_list 
		for: string 
		from: pos 
		to: currentPos 
		children: \{ PEGNode 
						newOn: #_list 
						for: string
						from: pos
						to: currentPos
						children: children \}'