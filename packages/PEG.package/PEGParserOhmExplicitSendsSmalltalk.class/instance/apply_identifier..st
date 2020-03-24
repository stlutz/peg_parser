as yet unclassified
apply_identifier: t1 
	^ (memoization at: t1)
		at: #'parse_identifier'
		ifAbsentPut: [| t2 |
			t2 := self parse_identifier: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #identifier
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]