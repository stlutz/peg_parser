as yet unclassified
parse_stringLiteral_2_1: t1 
	| t2 |
	t2 := self parse_stringLiteral_2_1_1: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_stringLiteral_2_1_2: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	^ nil