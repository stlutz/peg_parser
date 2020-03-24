as yet unclassified
parse_KeywordMessageArgument_2_1: t1 
	| t2 |
	t2 := self skipSpaces: t1.
	^ self apply_BinaryMessageChain: t2