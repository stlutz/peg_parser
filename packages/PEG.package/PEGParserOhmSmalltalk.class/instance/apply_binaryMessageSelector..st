as yet unclassified
apply_binaryMessageSelector: t1 
	^ (memoization at: t1)
		at: #'parse_binaryMessageSelector'
		ifAbsentPut: [| t2 |
			t2 := self parse_binaryMessageSelector: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #binaryMessageSelector
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]