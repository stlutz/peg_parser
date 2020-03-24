as yet unclassified
parse_Statement_1_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_AssignmentOperation: t2