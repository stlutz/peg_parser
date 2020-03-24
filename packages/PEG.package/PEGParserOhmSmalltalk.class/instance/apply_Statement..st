as yet unclassified
apply_Statement: t1 
	^ (memoization at: t1)
		at: #'parse_Statement'
		ifAbsentPut: [| t2 |
			t2 := self parse_Statement: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #Statement
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]