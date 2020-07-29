as yet unclassified
apply_number: t1 
	^ (memoization at: t1)
		at: #'parse_number'
		ifAbsentPut: [| t2 |
			t2 := self parse_number: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #number
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]