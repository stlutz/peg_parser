as yet unclassified
apply_alnum: t1 
	^ (memoization at: t1)
		at: #'parse_alnum'
		ifAbsentPut: [| t2 |
			t2 := self parse_alnum: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #alnum
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]