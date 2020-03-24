as yet unclassified
apply_radix: t1 
	^ (memoization at: t1)
		at: #'parse_radix'
		ifAbsentPut: [| t2 |
			t2 := self parse_radix: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #radix
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]