as yet unclassified
apply_normalFloatingPointLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_normalFloatingPointLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_normalFloatingPointLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #normalFloatingPointLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]