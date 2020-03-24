as yet unclassified
apply_FinalStatement: t1 
	^ (memoization at: t1)
		at: #'parse_FinalStatement'
		ifAbsentPut: [| t2 |
			t2 := self parse_FinalStatement: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #FinalStatement
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]