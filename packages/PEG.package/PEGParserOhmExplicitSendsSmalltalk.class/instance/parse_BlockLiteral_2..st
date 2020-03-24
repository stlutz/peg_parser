as yet unclassified
parse_BlockLiteral_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BlockLiteral_specialEmpty: t2