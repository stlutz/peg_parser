as yet unclassified
parse_Pragmas_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_Pragma: t2