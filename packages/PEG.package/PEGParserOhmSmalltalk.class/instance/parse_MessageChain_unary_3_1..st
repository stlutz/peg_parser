as yet unclassified
parse_MessageChain_unary_3_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessageChain: t2