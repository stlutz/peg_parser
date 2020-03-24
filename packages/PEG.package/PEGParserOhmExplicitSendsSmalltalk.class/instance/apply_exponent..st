as yet unclassified
apply_exponent: t1 
	^ (memoization at: t1)
		at: #'parse_exponent'
		ifAbsentPut: [| t2 |
			t2 := self parse_exponent: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #exponent
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]