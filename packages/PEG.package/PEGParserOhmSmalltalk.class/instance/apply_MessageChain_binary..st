as yet unclassified
apply_MessageChain_binary: t1 
	^ (memoization at: t1)
		at: #'parse_MessageChain_binary'
		ifAbsentPut: [| t2 |
			t2 := self parse_MessageChain_binary: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'MessageChain_binary'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]