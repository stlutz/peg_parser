method body generation
methodBodyTemplateForArityN
	self flag: #todo. "do children all have the same arity?"
	^ '| currentResult children currentPos columnarChildren |
	(currentResult := self {1}: pos)
		ifNil: [
			currentPos := pos.
			children := Array
							new: {2}
							withAll: (PEGNode 
										newOn: #_list 
										for: string
										from: pos
										to: pos
										children: #())]
		ifNotNil: [
			children := OrderedCollection new.
			children add: currentResult.
			currentPos := currentResult endPos.
			[
				(currentResult := self {1}: currentPos)
					ifNil: [false]
					ifNotNil: [
						currentPos := currentResult endPos.
						children add: currentResult.
						true]
			] whileTrue.

			columnarChildren := Array new: {2}.
			children ifNotEmpty: [
				1 to: {2} do: [:i |
					columnarChildren at: i put: OrderedCollection new].
				self rows: children toColumns: columnarChildren].
			children := columnarChildren collect: [:c |
							PEGNode 
								newOn: #_list 
								for: string
								from: pos
								to: currentPos
								children: c]].

	^ PEGShadowNode 
		newOn: #_list 
		for: string 
		from: pos 
		to: currentPos 
		children: children'