as yet unclassified
parse_BinaryMessageChain_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessage: t2