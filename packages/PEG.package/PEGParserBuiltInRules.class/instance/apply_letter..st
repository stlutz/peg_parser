as yet unclassified
apply_letter: t1 
	^ (memoization at: t1)
		at: #'parse_letter'
		ifAbsentPut: [| t2 |
			t2 := self parse_letter: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #letter
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]