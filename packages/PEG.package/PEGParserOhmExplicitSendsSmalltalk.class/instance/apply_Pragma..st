as yet unclassified
apply_Pragma: t1 
	^ (memoization at: t1)
		at: #'parse_Pragma'
		ifAbsentPut: [| t2 |
			t2 := self parse_Pragma: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #Pragma
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]