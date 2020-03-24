as yet unclassified
parse_UnaryMessage_1_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_keyword: t2