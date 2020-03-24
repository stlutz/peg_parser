as yet unclassified
apply_MethodHeader: t1 
	^ (memoization at: t1)
		at: #'parse_MethodHeader'
		ifAbsentPut: [| t2 |
			t2 := self parse_MethodHeader: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #MethodHeader
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]