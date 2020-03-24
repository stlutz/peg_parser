as yet unclassified
parse_BinaryMethodHeader_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_binaryMessageSelector: t2