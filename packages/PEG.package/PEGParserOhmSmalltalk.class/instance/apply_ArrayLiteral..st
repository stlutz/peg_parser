as yet unclassified
apply_ArrayLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_ArrayLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_ArrayLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #ArrayLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]