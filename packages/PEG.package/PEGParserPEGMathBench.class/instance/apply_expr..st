as yet unclassified
apply_expr: t1 
	^ (memoization at: t1)
		at: #'parse_expr'
		ifAbsentPut: [| t2 |
			t2 := self parse_expr: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #expr
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]