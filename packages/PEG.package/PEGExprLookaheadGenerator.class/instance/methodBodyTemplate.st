method body generation
methodBodyTemplate
	^ '^ (self {1}: pos) ifNotNil: [:childResult |
		PEGShadowNode
			newOn: #lookahead
			for: string
			from: pos
			to: pos
			children: childResult nodeList]'