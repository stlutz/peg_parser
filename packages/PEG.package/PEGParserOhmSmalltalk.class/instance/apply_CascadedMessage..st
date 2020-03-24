as yet unclassified
apply_CascadedMessage: t1 
	^ (memoization at: t1)
		at: #'parse_CascadedMessage'
		ifAbsentPut: [| t2 |
			t2 := self parse_CascadedMessage: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #CascadedMessage
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]