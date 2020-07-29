as yet unclassified
apply_number_int: t1 
	^ (memoization at: t1)
		at: #'parse_number_int'
		ifAbsentPut: [| t2 |
			t2 := self parse_number_int: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'number_int'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]