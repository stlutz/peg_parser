as yet unclassified
apply_KeywordPragma: t1 
	^ (memoization at: t1)
		at: #'parse_KeywordPragma'
		ifAbsentPut: [| t2 |
			t2 := self parse_KeywordPragma: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #KeywordPragma
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]