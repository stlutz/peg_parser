assertions
assertFixture: fixture
	
	| json ohmGrammar startRule parser |
	json := Json readFrom: (ReadStream on: fixture).
	ohmGrammar := OhmGrammar new: (json at: 'grammar').
	startRule := ohmGrammar defaultStartRuleName.
	
	"To ensure previous rules are cleaned up between runs.... --pre"
	self createNewParserClass.
	parserClass := PEGTestingOhmParserGenerator generateFrom: ohmGrammar category: categoryName suffix: randomString.
	parser := parserClass new.
	
	json at: 'matchContents' ifPresent: [:content |
		self assertMatchContents: content withParser: parser startingFrom: startRule].

	json at: 'matchInterval' ifPresent: [:content |
		"self assertMatchInterval: content withParser: parser startingFrom: startRule"].

	json at: 'matchTree' ifPresent: [:content |
		self assertMatchTree: content withParser: parser startingFrom: startRule].