method body generation
methodBodyTemplateForArityN
	self flag: #todo. "do children all have the same arity?"
	^ '| currentPos children columnarChildren |
	currentPos := pos.
	children := OrderedCollection new.
	[
		(self {1}: currentPos)
			ifNil: [false]
			ifNotNil: [:currentResult |
				currentPos := currentResult endPos.
				children add: currentResult.
				true]
	] whileTrue.

	columnarChildren := Array new: {2}.
	children ifNotEmpty: [
		1 to: {2} do: [:i |
			columnarChildren at: i put: OrderedCollection new].
		self rows: children toColumns: columnarChildren].
	
	^ PEGShadowNode 
		newOn: #_list 
		for: string 
		from: pos 
		to: currentPos 
		children: (columnarChildren collect: [:c |
					PEGNode 
						newOn: #_list 
						for: string
						from: pos
						to: currentPos
						children: c])'