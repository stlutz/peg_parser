as yet unclassified
apply_BinaryMessageOperand: t1 
	^ (memoization at: t1)
		at: #'parse_BinaryMessageOperand'
		ifAbsentPut: [| t2 |
			t2 := self parse_BinaryMessageOperand: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #BinaryMessageOperand
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]