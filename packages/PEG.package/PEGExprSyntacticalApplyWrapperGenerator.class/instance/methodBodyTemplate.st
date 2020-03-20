method body generation
methodBodyTemplate
	^ '| skipPos |
	skipPos := self skipSpaces: pos.
	^ self {1}: skipPos'