as yet unclassified
apply_UnaryMessageChain: t1 
	^ (memoization at: t1)
		at: #'parse_UnaryMessageChain'
		ifAbsentPut: [| t2 |
			t2 := self parse_UnaryMessageChain: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #UnaryMessageChain
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]