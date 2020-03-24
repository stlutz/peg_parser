as yet unclassified
parse_BlockLiteral_specialEmpty_2_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_blockArgument: t2