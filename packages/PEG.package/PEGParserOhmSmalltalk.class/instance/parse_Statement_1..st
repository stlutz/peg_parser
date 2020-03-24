as yet unclassified
parse_Statement_1: t1 
	| t2 t3 t5 t6 t7 |
	t3 := t1.
	t2 := OrderedCollection new.
	t6 := (1 to: 1)
				collect: [:t8 | OrderedCollection new].
	[t7 := self skipSpaces: t3.
	t5 := self parse_Statement_1_1: t7.
	t5
		ifNotNil: [t3 := t5 endPos.
			t2 add: t5]]
		doWhileTrue: [t5 notNil].
	t2
		ifEmpty: [t6 := t6
						collect: [:t8 | ]]
		ifNotEmpty: [self rows: t2 toColumns: t6].
	^ PEGShadowNode
		newOn: #'_list'
		for: string
		from: t1
		to: t3
		children: ((1 to: 1)
				collect: [:t8 | PEGNode
						newOn: #'_list'
						for: string
						from: t1
						to: t3
						children: (t6 at: t8)])