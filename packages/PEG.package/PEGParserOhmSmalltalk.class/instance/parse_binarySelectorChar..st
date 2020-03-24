as yet unclassified
parse_binarySelectorChar: t1 
	| t2 |
	t2 := self parse_binarySelectorChar_1: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_2: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_3: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_4: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_5: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_6: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_7: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_8: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_9: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_10: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_11: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_12: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_13: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_14: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_15: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	t2 := self parse_binarySelectorChar_16: t1.
	t2
		ifNotNil: [^ PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t2 endPos
				children: t2 nodeList].
	^ nil