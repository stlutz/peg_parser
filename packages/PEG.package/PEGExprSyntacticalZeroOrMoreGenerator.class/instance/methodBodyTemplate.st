method body generation
methodBodyTemplate
	^ '| currentPos currentResult children columnarChildren skipPos |
	currentPos := pos.
	children := OrderedCollection new.
	columnarChildren := (1 to: {2}) collect: [:n | OrderedCollection new].
	[
		skipPos := self skipSpaces: currentPos.
		currentResult := self {1}: skipPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult]
	] doWhileTrue: [currentResult notNil].

	children 
		ifEmpty: [columnarChildren := columnarChildren collect: [:c | nil]]
		ifNotEmpty: [self rows: children toColumns: columnarChildren].
	^ PEGShadowNode 
		newOn: #_list 
		for: string 
		from: pos 
		to: currentPos 
		children: ((1 to: {2}) collect: [:n | 
					PEGNode 
						newOn: #_list 
						for: string
						from: pos
						to: currentPos
						children: (columnarChildren at: n)])'