as yet unclassified
apply_MethodDeclaration: t1 
	^ (memoization at: t1)
		at: #'parse_MethodDeclaration'
		ifAbsentPut: [| t2 |
			t2 := self parse_MethodDeclaration: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #MethodDeclaration
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]