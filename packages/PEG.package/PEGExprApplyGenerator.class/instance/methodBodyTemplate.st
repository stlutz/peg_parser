method body generation
methodBodyTemplate
	^ '^ (memoization at: pos) at: #{1} ifAbsentPut: [
		(self {1}: pos) ifNotNil: [:childResult |
			PEGNode
				newOn: #{2}
				for: string
				from: pos
				to: childResult endPos
				children: childResult nodeList]]'