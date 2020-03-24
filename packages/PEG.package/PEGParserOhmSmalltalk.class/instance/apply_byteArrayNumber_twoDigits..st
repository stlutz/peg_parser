as yet unclassified
apply_byteArrayNumber_twoDigits: t1 
	^ (memoization at: t1)
		at: #'parse_byteArrayNumber_twoDigits'
		ifAbsentPut: [| t2 |
			t2 := self parse_byteArrayNumber_twoDigits: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'byteArrayNumber_twoDigits'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]