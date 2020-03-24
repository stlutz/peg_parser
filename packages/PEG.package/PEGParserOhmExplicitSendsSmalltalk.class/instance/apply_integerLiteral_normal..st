as yet unclassified
apply_integerLiteral_normal: t1 
	^ (memoization at: t1)
		at: #'parse_integerLiteral_normal'
		ifAbsentPut: [| t2 |
			t2 := self parse_integerLiteral_normal: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'integerLiteral_normal'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]