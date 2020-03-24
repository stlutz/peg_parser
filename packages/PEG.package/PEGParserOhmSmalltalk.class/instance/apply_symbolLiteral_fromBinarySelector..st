as yet unclassified
apply_symbolLiteral_fromBinarySelector: t1 
	^ (memoization at: t1)
		at: #'parse_symbolLiteral_fromBinarySelector'
		ifAbsentPut: [| t2 |
			t2 := self parse_symbolLiteral_fromBinarySelector: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'symbolLiteral_fromBinarySelector'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]