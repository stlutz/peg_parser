as yet unclassified
apply_characterLiteral: t1 
	^ (memoization at: t1)
		at: #'parse_characterLiteral'
		ifAbsentPut: [| t2 |
			t2 := self parse_characterLiteral: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #characterLiteral
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]