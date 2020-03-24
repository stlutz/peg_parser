as yet unclassified
apply_spaces: t1 
	^ (memoization at: t1)
		at: #'parse_spaces'
		ifAbsentPut: [| t2 |
			t2 := self parse_spaces: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #spaces
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]