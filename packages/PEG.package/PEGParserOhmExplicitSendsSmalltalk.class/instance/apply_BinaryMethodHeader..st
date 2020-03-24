as yet unclassified
apply_BinaryMethodHeader: t1 
	^ (memoization at: t1)
		at: #'parse_BinaryMethodHeader'
		ifAbsentPut: [| t2 |
			t2 := self parse_BinaryMethodHeader: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #BinaryMethodHeader
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]