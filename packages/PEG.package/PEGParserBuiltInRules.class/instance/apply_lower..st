as yet unclassified
apply_lower: t1 
	^ (memoization at: t1)
		at: #'parse_lower'
		ifAbsentPut: [| t2 |
			t2 := self parse_lower: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #lower
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]