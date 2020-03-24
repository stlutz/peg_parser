as yet unclassified
parse_ObjectArrayLiteralElement_normal: t1 
	| t2 t3 t4 |
	t2 := t1.
	t4 := OrderedCollection new: 2.
	t2 := self skipSpaces: t2.
	t3 := self parse_ObjectArrayLiteralElement_normal_1: t2.
	t3
		ifNil: [^ nil].
	t2 := t3 endPos.
	t4 add: t3.
	t2 := self skipSpaces: t2.
	t3 := self parse_ObjectArrayLiteralElement_normal_2: t2.
	t3
		ifNil: [^ nil].
	t2 := t3 endPos.
	t4 add: t3.
	^ PEGShadowNode
		newOn: #shadow
		for: string
		from: t1
		to: t2
		children: (t4 collect: #nodeList) flatten