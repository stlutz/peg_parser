as yet unclassified
parse_Literal: t1 
	| t2 |
	t2 := self parse_Literal_1: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_2: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_3: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_4: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_5: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_6: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_7: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_8: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_Literal_9: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	^ nil