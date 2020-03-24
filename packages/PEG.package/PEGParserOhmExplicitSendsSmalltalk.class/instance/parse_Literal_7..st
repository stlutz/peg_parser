as yet unclassified
parse_Literal_7: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_symbolLiteral: t2