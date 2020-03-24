as yet unclassified
parse_Statements_1_2_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_Statement: t2