as yet unclassified
apply_LiteralArrayLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_LiteralArrayLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_LiteralArrayLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #LiteralArrayLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]