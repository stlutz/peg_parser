as yet unclassified
parse_BinaryMessageSend_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessageReceiver: t2