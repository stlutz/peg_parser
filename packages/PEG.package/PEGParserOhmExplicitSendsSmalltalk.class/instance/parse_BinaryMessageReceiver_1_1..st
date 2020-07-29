as yet unclassified
parse_BinaryMessageReceiver_1_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessageSend: t2