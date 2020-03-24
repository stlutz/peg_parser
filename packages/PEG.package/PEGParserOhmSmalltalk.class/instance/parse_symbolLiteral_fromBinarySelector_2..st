as yet unclassified
parse_symbolLiteral_fromBinarySelector_2: t1 
	| t2 t3 t5 t6 |
	t3 := t1.
	t2 := OrderedCollection new.
	t6 := (1 to: 1)
				collect: [:t7 | OrderedCollection new].
	[t5 := self parse_symbolLiteral_fromBinarySelector_2_1: t3.
	t5
		ifNotNil: [t3 := t5 endPos.
			t2 add: t5]]
		doWhileTrue: [t5 notNil].
	t2
		ifEmpty: [t6 := t6
						collect: [:t7 | ]]
		ifNotEmpty: [self rows: t2 toColumns: t6].
	^ PEGShadowNode
		newOn: #'_list'
		for: string
		from: t1
		to: t3
		children: ((1 to: 1)
				collect: [:t7 | PEGNode
						newOn: #'_list'
						for: string
						from: t1
						to: t3
						children: (t6 at: t7)])