as yet unclassified
parse_MessageChain_unary_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_UnaryMessage: t2