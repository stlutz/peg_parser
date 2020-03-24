as yet unclassified
apply_BlockLiteral_normal: t1 
	^ (memoization at: t1)
		at: #'parse_BlockLiteral_normal'
		ifAbsentPut: [| t2 |
			t2 := self parse_BlockLiteral_normal: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'BlockLiteral_normal'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]