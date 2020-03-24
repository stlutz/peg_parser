as yet unclassified
apply_byteArrayNumber: t1 
	^ (memoization at: t1)
		at: #'parse_byteArrayNumber'
		ifAbsentPut: [| t2 |
			t2 := self parse_byteArrayNumber: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #byteArrayNumber
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]