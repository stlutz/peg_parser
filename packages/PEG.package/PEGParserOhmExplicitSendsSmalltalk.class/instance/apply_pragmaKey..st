as yet unclassified
apply_pragmaKey: t1 
	^ (memoization at: t1)
		at: #'parse_pragmaKey'
		ifAbsentPut: [| t2 |
			t2 := self parse_pragmaKey: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #pragmaKey
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]