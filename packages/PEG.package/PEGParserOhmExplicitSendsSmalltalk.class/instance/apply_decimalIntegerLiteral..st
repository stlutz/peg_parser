as yet unclassified
apply_decimalIntegerLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_decimalIntegerLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_decimalIntegerLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #decimalIntegerLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]