as yet unclassified
apply_ObjectArrayLiteralElement_normal: t1 
	^ (memoization at: t1)
		at: #'parse_ObjectArrayLiteralElement_normal'
		ifAbsentPut: [| t2 |
			t2 := self parse_ObjectArrayLiteralElement_normal: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'ObjectArrayLiteralElement_normal'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]