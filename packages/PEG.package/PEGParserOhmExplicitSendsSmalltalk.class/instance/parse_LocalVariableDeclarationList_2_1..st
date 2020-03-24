as yet unclassified
parse_LocalVariableDeclarationList_2_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_bindableIdentifier: t2