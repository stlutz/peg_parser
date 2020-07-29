as yet unclassified
parse_MessageChain_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessage: t2