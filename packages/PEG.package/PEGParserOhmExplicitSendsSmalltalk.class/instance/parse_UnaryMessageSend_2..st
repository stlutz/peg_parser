as yet unclassified
parse_UnaryMessageSend_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_UnaryMessageSend_base: t2