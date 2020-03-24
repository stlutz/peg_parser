as yet unclassified
parse_BinaryMessage_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessageOperand: t2