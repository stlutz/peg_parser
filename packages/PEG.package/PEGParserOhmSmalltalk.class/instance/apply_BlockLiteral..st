as yet unclassified
apply_BlockLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_BlockLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_BlockLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #BlockLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]