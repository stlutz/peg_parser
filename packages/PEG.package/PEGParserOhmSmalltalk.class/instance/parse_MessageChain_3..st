as yet unclassified
parse_MessageChain_3: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_MessageChain_unary: t2