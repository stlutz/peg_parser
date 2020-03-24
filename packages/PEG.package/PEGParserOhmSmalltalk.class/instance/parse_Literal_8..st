as yet unclassified
parse_Literal_8: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_ArrayLiteral: t2