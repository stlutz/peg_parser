as yet unclassified
parse_Statement_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_Expression: t2