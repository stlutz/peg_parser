as yet unclassified
parse_KeywordMessageArgument: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessageSend: t2