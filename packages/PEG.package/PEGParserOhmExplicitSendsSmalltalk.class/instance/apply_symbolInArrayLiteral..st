as yet unclassified
apply_symbolInArrayLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_symbolInArrayLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_symbolInArrayLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #symbolInArrayLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]