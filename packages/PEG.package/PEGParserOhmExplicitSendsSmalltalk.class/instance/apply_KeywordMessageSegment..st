as yet unclassified
apply_KeywordMessageSegment: t1 
	^ (memoization at: t1)
		at: #'parse_KeywordMessageSegment'
		ifAbsentPut: [| t2 |
			t2 := self parse_KeywordMessageSegment: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #KeywordMessageSegment
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]