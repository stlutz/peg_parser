as yet unclassified
parse_UnaryMessageSend_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_UnaryMessageSend_message: t2