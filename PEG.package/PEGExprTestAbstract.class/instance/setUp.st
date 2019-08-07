as yet unclassified
setUp
	| randomString |
	randomString := (Random new) next asString.
	randomString := randomString copyFrom: 3 to: (randomString size - 2).
	
	categoryName := 'PEG-ParserGenerators-Testclasses'.
	parserName := 'PEGParser' , randomString.

	parserClass := PEGExprGenerator subclass: parserName asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: categoryName