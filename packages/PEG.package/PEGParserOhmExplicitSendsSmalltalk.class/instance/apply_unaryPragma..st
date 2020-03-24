as yet unclassified
apply_unaryPragma: t1 
	^ (memoization at: t1)
		at: #'parse_unaryPragma'
		ifAbsentPut: [| t2 |
			t2 := self parse_unaryPragma: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #unaryPragma
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]