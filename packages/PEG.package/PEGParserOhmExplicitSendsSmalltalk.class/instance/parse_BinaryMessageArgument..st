as yet unclassified
parse_BinaryMessageArgument: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_UnaryMessageSend: t2