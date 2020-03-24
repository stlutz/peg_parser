as yet unclassified
apply_binarySelectorChar: t1 
	^ (memoization at: t1)
		at: #'parse_binarySelectorChar'
		ifAbsentPut: [| t2 |
			t2 := self parse_binarySelectorChar: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #binarySelectorChar
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]