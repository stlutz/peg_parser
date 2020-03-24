as yet unclassified
apply_BinaryMessageChain: t1 
	^ (memoization at: t1)
		at: #'parse_BinaryMessageChain'
		ifAbsentPut: [| t2 |
			t2 := self parse_BinaryMessageChain: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #BinaryMessageChain
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]