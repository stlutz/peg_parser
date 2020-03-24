as yet unclassified
apply_Literal: t1 
	^ (memoization at: t1)
		at: #'parse_Literal'
		ifAbsentPut: [| t2 |
			t2 := self parse_Literal: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #Literal
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]