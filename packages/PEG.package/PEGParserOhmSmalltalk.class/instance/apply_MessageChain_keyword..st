as yet unclassified
apply_MessageChain_keyword: t1 
	^ (memoization at: t1)
		at: #'parse_MessageChain_keyword'
		ifAbsentPut: [| t2 |
			t2 := self parse_MessageChain_keyword: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'MessageChain_keyword'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]