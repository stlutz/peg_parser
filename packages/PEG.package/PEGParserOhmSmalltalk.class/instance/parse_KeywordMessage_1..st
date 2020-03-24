as yet unclassified
parse_KeywordMessage_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_KeywordMessageSegment: t2