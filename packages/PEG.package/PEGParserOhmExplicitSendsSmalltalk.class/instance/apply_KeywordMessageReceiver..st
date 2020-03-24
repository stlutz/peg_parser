as yet unclassified
apply_KeywordMessageReceiver: t1 
	^ (memoization at: t1)
		at: #'parse_KeywordMessageReceiver'
		ifAbsentPut: [| t2 |
			t2 := self parse_KeywordMessageReceiver: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #KeywordMessageReceiver
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]