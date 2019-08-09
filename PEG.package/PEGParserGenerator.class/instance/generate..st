as yet unclassified
generate: aGrammarName
	| parserClass |
	parserClass := Object subclass: ('PEGParser' , aGrammarName) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'PEG-ParserGenerator-Parsers'.
	
	rules keysAndValuesDo: [:ruleName :exprGenerator |
		exprGenerator compile: ruleName asSymbol into: parserClass].

	^ parserClass