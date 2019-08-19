as yet unclassified
generate: aGrammarName
	| parserClass |
	parserClass := PEGParser subclass: ('PEGParser' , aGrammarName) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'PEG-ParserGenerator-Parsers'.

	rules keysAndValuesDo: [:ruleName :exprGenerator |
		| methodName |
		methodName := 'parse_' , ruleName.
		exprGenerator compile: methodName asSymbol into: parserClass].

	^ parserClass