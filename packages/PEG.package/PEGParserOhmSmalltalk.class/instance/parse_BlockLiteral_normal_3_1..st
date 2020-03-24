as yet unclassified
parse_BlockLiteral_normal_3_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_ExecutableCode: t2