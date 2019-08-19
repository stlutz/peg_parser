as yet unclassified
generate: aGrammarName
	| parserClass |
	parserClass := PEGParser subclass: ('PEGParser' , aGrammarName) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'PEG-ParserGenerator-Parsers'.

	rules keysAndValuesDo: [:ruleName :exprGenerator |
		| methodName childName methodString |
		methodName := 'parse_' , ruleName.
		childName := PEGExprGenerator childName: methodName.
		childName := exprGenerator compile: childName asSymbol into: parserClass.

		methodString := (PEGExprGenerator methodHead: methodName) , Character lf , '^self ' , childName , ': string atPos: pos'.
		parserClass compileSilently: methodString].

	^ parserClass