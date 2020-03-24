as yet unclassified
apply_upper: t1 
	^ (memoization at: t1)
		at: #'parse_upper'
		ifAbsentPut: [| t2 |
			t2 := self parse_upper: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #upper
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]