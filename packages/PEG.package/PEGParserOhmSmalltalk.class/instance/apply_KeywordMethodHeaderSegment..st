as yet unclassified
apply_KeywordMethodHeaderSegment: t1 
	^ (memoization at: t1)
		at: #'parse_KeywordMethodHeaderSegment'
		ifAbsentPut: [| t2 |
			t2 := self parse_KeywordMethodHeaderSegment: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #KeywordMethodHeaderSegment
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]