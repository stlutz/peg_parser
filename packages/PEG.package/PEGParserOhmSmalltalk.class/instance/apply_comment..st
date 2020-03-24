as yet unclassified
apply_comment: t1 
	^ (memoization at: t1)
		at: #'parse_comment'
		ifAbsentPut: [| t2 |
			t2 := self parse_comment: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #comment
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]