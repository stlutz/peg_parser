as yet unclassified
apply_BinaryMessageArgument: t1 
	^ (memoization at: t1)
		at: #'parse_BinaryMessageArgument'
		ifAbsentPut: [| t2 |
			t2 := self parse_BinaryMessageArgument: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #BinaryMessageArgument
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]