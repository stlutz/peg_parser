as yet unclassified
apply_space: t1 
	^ (memoization at: t1)
		at: #'parse_space'
		ifAbsentPut: [| t2 |
			t2 := self parse_space: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #space
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]