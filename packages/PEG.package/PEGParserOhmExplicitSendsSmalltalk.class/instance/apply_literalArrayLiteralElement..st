as yet unclassified
apply_literalArrayLiteralElement: t1 
	^ (memoization at: t1)
		at: #'parse_literalArrayLiteralElement'
		ifAbsentPut: [| t2 |
			t2 := self parse_literalArrayLiteralElement: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #literalArrayLiteralElement
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]