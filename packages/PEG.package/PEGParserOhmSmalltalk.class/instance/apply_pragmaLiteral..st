as yet unclassified
apply_pragmaLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_pragmaLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_pragmaLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #pragmaLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]