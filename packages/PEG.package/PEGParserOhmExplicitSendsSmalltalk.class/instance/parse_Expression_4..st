as yet unclassified
parse_Expression_4: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_KeywordMessageSend: t2