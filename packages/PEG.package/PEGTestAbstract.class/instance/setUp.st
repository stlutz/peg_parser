running
setUp
	
	categoryName := 'PEG-ParserGenerators-Testclasses'.
	randomString := self newRandomString.
	parserName := randomString. "to initialize for create parser class"
	parserClass := self createNewParserClass