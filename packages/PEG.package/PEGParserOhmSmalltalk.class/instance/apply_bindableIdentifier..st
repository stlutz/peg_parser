as yet unclassified
apply_bindableIdentifier: t1 
	^ (memoization at: t1)
		at: #'parse_bindableIdentifier'
		ifAbsentPut: [| t2 |
			t2 := self parse_bindableIdentifier: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #bindableIdentifier
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]