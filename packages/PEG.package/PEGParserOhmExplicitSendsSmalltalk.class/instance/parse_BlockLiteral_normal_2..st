as yet unclassified
parse_BlockLiteral_normal_2: t1 
	| t2 |
	t2 := self parse_BlockLiteral_normal_2_1: t1.
	^ t2
		ifNil: [PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t1
				children: ((1 to: 1)
						collect: [:t3 | PEGNode
								newOn: #'_terminal'
								for: string
								from: t1
								to: t1
								children: {nil} asOrderedCollection])]
		ifNotNil: [^ t2]