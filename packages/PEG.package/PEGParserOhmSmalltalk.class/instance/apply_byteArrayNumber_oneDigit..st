as yet unclassified
apply_byteArrayNumber_oneDigit: t1 
	^ (memoization at: t1)
		at: #'parse_byteArrayNumber_oneDigit'
		ifAbsentPut: [| t2 |
			t2 := self parse_byteArrayNumber_oneDigit: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'byteArrayNumber_oneDigit'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]