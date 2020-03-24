as yet unclassified
apply_MoreExecutableCode: t1 
	^ (memoization at: t1)
		at: #'parse_MoreExecutableCode'
		ifAbsentPut: [| t2 |
			t2 := self parse_MoreExecutableCode: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #MoreExecutableCode
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]