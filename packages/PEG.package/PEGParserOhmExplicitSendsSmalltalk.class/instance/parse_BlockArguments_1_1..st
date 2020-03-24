as yet unclassified
parse_BlockArguments_1_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_blockArgument: t2