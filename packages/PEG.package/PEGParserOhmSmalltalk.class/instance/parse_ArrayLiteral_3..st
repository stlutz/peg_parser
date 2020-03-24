as yet unclassified
parse_ArrayLiteral_3: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_LiteralArrayLiteral: t2