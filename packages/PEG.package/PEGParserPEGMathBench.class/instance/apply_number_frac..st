as yet unclassified
apply_number_frac: t1 
	^ (memoization at: t1)
		at: #'parse_number_frac'
		ifAbsentPut: [| t2 |
			t2 := self parse_number_frac: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'number_frac'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]