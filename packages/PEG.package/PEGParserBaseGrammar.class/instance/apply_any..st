as yet unclassified
apply_any: t1 
	^ (memoization at: t1)
		at: #'parse_any'
		ifAbsentPut: [| t2 |
			t2 := self parse_any: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #any
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]