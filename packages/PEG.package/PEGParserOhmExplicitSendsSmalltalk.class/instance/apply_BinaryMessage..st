as yet unclassified
apply_BinaryMessage: t1 
	^ (memoization at: t1)
		at: #'parse_BinaryMessage'
		ifAbsentPut: [| t2 |
			t2 := self parse_BinaryMessage: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #BinaryMessage
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]