as yet unclassified
apply_symbolLiteral_fromString: t1 
	^ (memoization at: t1)
		at: #'parse_symbolLiteral_fromString'
		ifAbsentPut: [| t2 |
			t2 := self parse_symbolLiteral_fromString: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'symbolLiteral_fromString'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]