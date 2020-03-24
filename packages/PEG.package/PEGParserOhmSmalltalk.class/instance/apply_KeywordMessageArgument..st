as yet unclassified
apply_KeywordMessageArgument: t1 
	^ (memoization at: t1)
		at: #'parse_KeywordMessageArgument'
		ifAbsentPut: [| t2 |
			t2 := self parse_KeywordMessageArgument: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #KeywordMessageArgument
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]