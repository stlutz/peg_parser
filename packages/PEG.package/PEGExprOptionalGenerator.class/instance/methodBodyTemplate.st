method body generation
methodBodyTemplate
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGShadowNode
				newOn: #shadow
				for: string
				from: pos
				to: pos
				children: ((1 to: {2}) collect: [:n | 
					PEGNode 
						newOn: #_terminal 
						for: string 
						from: pos 
						to: pos 
						children: \{nil\} asOrderedCollection])]
		ifNotNil: [
			^ childResult]'