method body generation
methodBodyTemplate
	^ '| currentPos currentResult children columnarChildren |
	currentPos := pos.
	children := OrderedCollection new.
	columnarChildren := (1 to: {2}) collect: [:n | OrderedCollection new].
	[
		currentResult := self {1}: currentPos.
		currentResult ifNotNil: [
			currentPos := currentResult endPos.
			children add: currentResult]
	] doWhileTrue: [currentResult notNil].

	^ children size > 0
		ifTrue: [
			self rows: children toColumns: columnarChildren.
			PEGShadowNode
				newOn: #shadow
				for: string
				from: pos
				to: currentPos
				children: ((1 to: {2}) collect: [:n | 
					PEGNode 
						newOn: #_list 
						for: string
						from: pos
						to: currentPos
						children: (columnarChildren at: n)])]
		ifFalse: [
			"We fail as there are not enough results"
			nil]'