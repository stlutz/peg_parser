as yet unclassified
apply_MessageChain_unary: t1 
	^ (memoization at: t1)
		at: #'parse_MessageChain_unary'
		ifAbsentPut: [| t2 |
			t2 := self parse_MessageChain_unary: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'MessageChain_unary'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]