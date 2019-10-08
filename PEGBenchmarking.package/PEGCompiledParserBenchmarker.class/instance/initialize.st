initialize-release
initialize
	| parserClass |
	parserClass := PEGOhmParserGenerator generateFrom: OhmSmalltalk OhmInstance.
	parser := parserClass new.