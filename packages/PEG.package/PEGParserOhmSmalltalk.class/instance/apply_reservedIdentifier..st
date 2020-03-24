as yet unclassified
apply_reservedIdentifier: t1 
	^ (memoization at: t1)
		at: #'parse_reservedIdentifier'
		ifAbsentPut: [| t2 |
			t2 := self parse_reservedIdentifier: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #reservedIdentifier
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]