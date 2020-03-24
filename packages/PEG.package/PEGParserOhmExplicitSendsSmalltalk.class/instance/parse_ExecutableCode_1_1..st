as yet unclassified
parse_ExecutableCode_1_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_LocalVariableDeclarationList: t2