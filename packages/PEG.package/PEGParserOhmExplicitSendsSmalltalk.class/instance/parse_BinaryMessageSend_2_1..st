as yet unclassified
parse_BinaryMessageSend_2_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessage: t2