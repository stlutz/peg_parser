as yet unclassified
initialize
	| parserClass |
	parserClass := PEGOhmParserGenerator generateFrom: OhmSmalltalk OhmInstance.
	parser := parserClass new.