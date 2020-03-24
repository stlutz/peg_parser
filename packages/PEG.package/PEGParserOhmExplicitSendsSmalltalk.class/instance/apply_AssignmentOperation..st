as yet unclassified
apply_AssignmentOperation: t1 
	^ (memoization at: t1)
		at: #'parse_AssignmentOperation'
		ifAbsentPut: [| t2 |
			t2 := self parse_AssignmentOperation: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #AssignmentOperation
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]