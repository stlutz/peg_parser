as yet unclassified
parse_Literal_5: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_integerLiteral: t2