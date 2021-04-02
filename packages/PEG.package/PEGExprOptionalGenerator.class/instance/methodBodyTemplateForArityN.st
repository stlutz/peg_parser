method body generation
methodBodyTemplateForArityN
	^ '| children |
	(self {1}: pos) ifNotNil: [:childResult | ^ childResult].
	
	^ PEGShadowNode
		newOn: #shadow
		for: string
		from: pos
		to: pos
		children: (Array
					new: {2}
					withAll: (PEGNode
								newOn: #_terminal
								for: string
								from: pos
								to: pos
								children: #(nil)))'