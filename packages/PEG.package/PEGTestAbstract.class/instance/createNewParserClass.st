private
createNewParserClass

	Smalltalk at: parserName asSymbol ifPresent: [:cl | cl removeFromSystem].
	parserName := 'PEGParser' , randomString.
	^ PEGParser subclass: parserName asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: categoryName