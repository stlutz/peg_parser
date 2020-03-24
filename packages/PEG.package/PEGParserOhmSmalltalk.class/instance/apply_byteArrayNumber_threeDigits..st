as yet unclassified
apply_byteArrayNumber_threeDigits: t1 
	^ (memoization at: t1)
		at: #'parse_byteArrayNumber_threeDigits'
		ifAbsentPut: [| t2 |
			t2 := self parse_byteArrayNumber_threeDigits: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'byteArrayNumber_threeDigits'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]