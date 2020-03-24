as yet unclassified
apply_assignmentOperator: t1 
	^ (memoization at: t1)
		at: #'parse_assignmentOperator'
		ifAbsentPut: [| t2 |
			t2 := self parse_assignmentOperator: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #assignmentOperator
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]