method body generation
methodBodyTemplateForArity1
	^ '(self {1}: pos) ifNotNil: [:childResult | ^ childResult].
	
	^ PEGShadowNode
		newOn: #shadow
		for: string
		from: pos
		to: pos
		children: \{ PEGNode
					newOn: #_terminal
					for: string
					from: pos
					to: pos
					children: #(nil) \}'