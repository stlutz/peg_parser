as yet unclassified
apply_Operand: t1 
	^ (memoization at: t1)
		at: #'parse_Operand'
		ifAbsentPut: [| t2 |
			t2 := self parse_Operand: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #Operand
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]