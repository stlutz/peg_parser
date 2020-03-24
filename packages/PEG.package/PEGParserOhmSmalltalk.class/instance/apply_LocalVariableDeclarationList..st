as yet unclassified
apply_LocalVariableDeclarationList: t1 
	^ (memoization at: t1)
		at: #'parse_LocalVariableDeclarationList'
		ifAbsentPut: [| t2 |
			t2 := self parse_LocalVariableDeclarationList: t1.
			t2
				ifNotNil: [PEGNode
						newOn: #LocalVariableDeclarationList
						for: string
						from: t1
						to: t2 endPos
						children: t2 nodeList]]