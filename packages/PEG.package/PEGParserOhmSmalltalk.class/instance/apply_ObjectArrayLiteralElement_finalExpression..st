as yet unclassified
apply_ObjectArrayLiteralElement_finalExpression: t1 
	^ (memoization at: t1)
		at: #'parse_ObjectArrayLiteralElement_finalExpression'
		ifAbsentPut: [| t2 |
			t2 := self parse_ObjectArrayLiteralElement_finalExpression: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'ObjectArrayLiteralElement_finalExpression'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]