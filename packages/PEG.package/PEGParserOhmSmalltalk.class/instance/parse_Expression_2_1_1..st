as yet unclassified
parse_Expression_2_1_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_MessageChain: t2