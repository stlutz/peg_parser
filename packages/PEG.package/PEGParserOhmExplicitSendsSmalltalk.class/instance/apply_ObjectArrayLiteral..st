as yet unclassified
apply_ObjectArrayLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_ObjectArrayLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_ObjectArrayLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #ObjectArrayLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]