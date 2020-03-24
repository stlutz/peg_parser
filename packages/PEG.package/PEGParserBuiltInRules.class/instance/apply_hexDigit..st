as yet unclassified
apply_hexDigit: t1 
	^ (memoization at: t1)
		at: #'parse_hexDigit'
		ifAbsentPut: [| t2 |
			t2 := self parse_hexDigit: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #hexDigit
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]