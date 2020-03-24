as yet unclassified
parse_symbolInArrayLiteral_code: t1 
	| t2 t3 t4 t6 |
	t4 := t1.
	t2 := OrderedCollection new.
	t3 := (1 to: 1)
				collect: [:t7 | OrderedCollection new].
	[t6 := self parse_symbolInArrayLiteral_code_1: t4.
	t6
		ifNotNil: [t4 := t6 endPos.
			t2 add: t6]]
		doWhileTrue: [t6 notNil].
	^ t2 size > 0
		ifTrue: [self rows: t2 toColumns: t3.
			PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t4
				children: ((1 to: 1)
						collect: [:t7 | PEGNode
								newOn: #'_list'
								for: string
								from: t1
								to: t4
								children: (t3 at: t7)])]