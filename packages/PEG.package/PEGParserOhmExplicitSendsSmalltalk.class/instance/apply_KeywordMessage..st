as yet unclassified
apply_KeywordMessage: t1 
	^ (memoization at: t1)
		at: #'parse_KeywordMessage'
		ifAbsentPut: [| t2 |
			t2 := self parse_KeywordMessage: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #KeywordMessage
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]