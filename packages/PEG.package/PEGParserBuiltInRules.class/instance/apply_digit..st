as yet unclassified
apply_digit: t1 
	^ (memoization at: t1)
		at: #'parse_digit'
		ifAbsentPut: [| t2 |
			t2 := self parse_digit: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #digit
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]