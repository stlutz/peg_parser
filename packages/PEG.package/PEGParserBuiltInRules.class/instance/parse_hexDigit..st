as yet unclassified
parse_hexDigit: t1 
	| t2 |
	t2 := self parse_hexDigit_1: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_hexDigit_2: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_hexDigit_3: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	^ nil