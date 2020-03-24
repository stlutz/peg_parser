as yet unclassified
apply_pseudoVariableReference: t1 
	^ (memoization at: t1)
		at: #'parse_pseudoVariableReference'
		ifAbsentPut: [| t2 |
			t2 := self parse_pseudoVariableReference: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #pseudoVariableReference
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]