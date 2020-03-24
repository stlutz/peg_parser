as yet unclassified
parse_Literal_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_constantReference: t2