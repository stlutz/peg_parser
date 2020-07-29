as yet unclassified
parse_Literal_10: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BlockLiteral: t2