method body generation
methodBodyTemplateForArity1
	self flag: #todo. "can children have an empty nodeList?"
	^ '| currentResult currentPos children |
	"manual loop unroll to avoid creating the children collection if possible"
	(currentResult := self {1}: pos) ifNil: [^ nil].
	currentPos := currentResult endPos.
	children := OrderedCollection with: (currentResult nodeList at: 1).
	
	[
		(currentResult := self {1}: currentPos)
			ifNil: [false]
			ifNotNil: [
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