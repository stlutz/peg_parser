as yet unclassified
parse_ObjectArrayLiteralElement_2: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_ObjectArrayLiteralElement_finalExpression: t2