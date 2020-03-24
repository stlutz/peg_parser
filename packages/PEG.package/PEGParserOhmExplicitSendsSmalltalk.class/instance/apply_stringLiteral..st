as yet unclassified
apply_stringLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_stringLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_stringLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #stringLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]