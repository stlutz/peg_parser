as yet unclassified
apply_Reference: t1 
	^ (memoization at: t1)
		at: #'parse_Reference'
		ifAbsentPut: [| t2 |
			t2 := self parse_Reference: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #Reference
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]