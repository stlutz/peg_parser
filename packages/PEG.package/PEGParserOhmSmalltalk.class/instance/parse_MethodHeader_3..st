as yet unclassified
parse_MethodHeader_3: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_UnaryMethodHeader: t2