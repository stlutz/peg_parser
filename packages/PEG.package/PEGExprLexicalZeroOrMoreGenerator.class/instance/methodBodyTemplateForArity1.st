method body generation
methodBodyTemplateForArity1
	self flag: #todo. "can children have an empty nodeList?"
	^ '| currentResult children currentPos columnarChildren |
	(currentResult := self {1}: pos)
		ifNil: [
			currentPos := pos.
			children := #()]
		ifNotNil: [
			children := OrderedCollection new.
			children add: (currentResult nodeList at: 1).
			currentPos := currentResult endPos.
			[
				(currentResult := self {1}: currentPos)
					ifNil: [false]
					ifNotNil: [
						currentPos := currentResult endPos.
						children add: (currentResult nodeList at: 1).
						true]
			] whileTrue].

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