as yet unclassified
apply_symbolLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_symbolLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_symbolLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #symbolLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]