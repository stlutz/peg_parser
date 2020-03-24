as yet unclassified
apply_UnaryMessage: t1 
	^ (memoization at: t1)
		at: #'parse_UnaryMessage'
		ifAbsentPut: [| t2 |
			t2 := self parse_UnaryMessage: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #UnaryMessage
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]