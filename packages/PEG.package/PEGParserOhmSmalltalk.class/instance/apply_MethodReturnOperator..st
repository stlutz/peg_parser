as yet unclassified
apply_MethodReturnOperator: t1 
	^ (memoization at: t1)
		at: #'parse_MethodReturnOperator'
		ifAbsentPut: [| t2 |
			t2 := self parse_MethodReturnOperator: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #MethodReturnOperator
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]