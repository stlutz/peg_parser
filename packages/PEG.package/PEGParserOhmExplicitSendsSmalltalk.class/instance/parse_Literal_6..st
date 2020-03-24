as yet unclassified
parse_Literal_6: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_stringLiteral: t2