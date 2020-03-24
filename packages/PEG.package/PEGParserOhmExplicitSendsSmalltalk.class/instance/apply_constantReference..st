as yet unclassified
apply_constantReference: t1 
	^ (memoization at: t1)
		at: #'parse_constantReference'
		ifAbsentPut: [| t2 |
			t2 := self parse_constantReference: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #constantReference
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]