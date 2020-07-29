as yet unclassified
apply_priexpr: t1 
	^ (memoization at: t1)
		at: #'parse_priexpr'
		ifAbsentPut: [| t2 |
			t2 := self parse_priexpr: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #priexpr
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]