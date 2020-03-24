as yet unclassified
parse_UnaryMessageSend_message_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_UnaryMessage: t2