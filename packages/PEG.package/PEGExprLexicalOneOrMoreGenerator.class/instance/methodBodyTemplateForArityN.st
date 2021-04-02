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

	children ifEmpty: [^ nil]. "We fail as there are not enough results"
	
	columnarChildren := Array new: {2}.
	1 to: {2} do: [:i |
		columnarChildren at: i put: OrderedCollection new].
	self rows: children toColumns: columnarChildren.
	
	^ PEGShadowNode
		newOn: #shadow
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