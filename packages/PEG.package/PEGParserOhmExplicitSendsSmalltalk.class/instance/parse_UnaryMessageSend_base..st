as yet unclassified
parse_UnaryMessageSend_base: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_Operand: t2