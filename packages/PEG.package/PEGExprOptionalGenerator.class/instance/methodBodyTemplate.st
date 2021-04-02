method body generation
methodBodyTemplate
	^ '| children |
	(self {1}: pos) ifNotNil: [:childResult | ^ childResult].
	
	children := Array new: {2}.
	1 to: {2} do: [:i |
		children at: i put: (PEGNode
				newOn: #_terminal
				for: string
				from: pos
				to: pos
				children: #(nil))].
	
	^ PEGShadowNode
		newOn: #shadow
		for: string
		from: pos
		to: pos
		children: children'