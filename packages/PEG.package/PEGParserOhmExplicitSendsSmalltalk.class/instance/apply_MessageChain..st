as yet unclassified
apply_MessageChain: t1 
	^ (memoization at: t1)
		at: #'parse_MessageChain'
		ifAbsentPut: [| t2 |
			t2 := self parse_MessageChain: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #MessageChain
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]