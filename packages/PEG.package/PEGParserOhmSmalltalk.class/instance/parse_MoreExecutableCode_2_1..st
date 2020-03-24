as yet unclassified
parse_MoreExecutableCode_2_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_FinalStatement: t2