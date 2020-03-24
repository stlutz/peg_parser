as yet unclassified
apply_end: t1 
	^ (memoization at: t1)
		at: #'parse_end'
		ifAbsentPut: [| t2 |
			t2 := self parse_end: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #end
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]