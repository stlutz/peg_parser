as yet unclassified
apply_priexpr_neg: t1 
	^ (memoization at: t1)
		at: #'parse_priexpr_neg'
		ifAbsentPut: [| t2 |
			t2 := self parse_priexpr_neg: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'priexpr_neg'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]