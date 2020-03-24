as yet unclassified
parse_scaledDecimalLiteral_2: t1 
	| t2 |
	t2 := self parse_scaledDecimalLiteral_2_1: t1.
	^ t2
		ifNil: [PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t1
				children: ((1 to: 2)
						collect: [:t3 | PEGNode
								newOn: #'_terminal'
								for: string
								from: t1
								to: t1
								children: {nil} asOrderedCollection])]
		ifNotNil: [^ t2]