as yet unclassified
apply_expexpr_power: t1 
	^ (memoization at: t1)
		at: #'parse_expexpr_power'
		ifAbsentPut: [| t2 |
			t2 := self parse_expexpr_power: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #'expexpr_power'
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]