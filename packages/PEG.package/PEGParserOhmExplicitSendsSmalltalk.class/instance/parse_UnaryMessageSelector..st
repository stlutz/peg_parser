as yet unclassified
parse_UnaryMessageSelector: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_identifier: t2