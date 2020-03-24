as yet unclassified
apply_baseNIntegerLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_baseNIntegerLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_baseNIntegerLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #baseNIntegerLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]