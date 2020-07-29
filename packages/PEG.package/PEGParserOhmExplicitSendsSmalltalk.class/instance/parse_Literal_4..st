as yet unclassified
parse_Literal_4: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_floatingPointLiteral: t2