as yet unclassified
parse_KeywordMessage: t1 
	| t2 t3 t5 t6 t7 |
	t3 := t1.
	t2 := OrderedCollection new.
	t6 := (1 to: 1)
				collect: [:t8 | OrderedCollection new].
	[t7 := self skipSpaces: t3.
	t5 := self parse_KeywordMessage_1: t7.
	t5
		ifNotNil: [t3 := t5 endPos.
			t2 add: t5]]
		doWhileTrue: [t5 notNil].
	t2
		ifEmpty: [t6 := t6
						collect: [:t8 | ]]
		ifNotEmpty: [self rows: t2 toColumns: t6].
	^ t2 size > 0
		ifTrue: [PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 last endPos
				children: ((1 to: 1)
						collect: [:t8 | PEGNode
								newOn: #'_list'
								for: string
								from: t1
								to: t2 last endPos
								children: (t6 at: t8)])]