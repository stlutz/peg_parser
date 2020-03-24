as yet unclassified
parse_BinaryMessageReceiver_3: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_Operand: t2