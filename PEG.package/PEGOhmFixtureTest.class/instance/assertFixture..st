as yet unclassified
assertFixture: fixture
	| json ohmGrammar startRule parser |
	json := Json readFrom: (ReadStream on: fixture).
	ohmGrammar := OhmGrammar new: (json at: 'grammar').
	startRule := ohmGrammar defaultStartRuleName.
	
	parserClass := PEGTestingOhmParserGenerator generateFrom: ohmGrammar category: categoryName suffix: randomString.
	parser := parserClass new.
	
	(json includesKey: 'matchContents') ifTrue: [
		self assertMatchContents: (json at: 'matchContents') withParser: parser startingFrom: startRule].

	(json includesKey: 'matchInterval') ifTrue: [
		self assertMatchInterval: (json at: 'matchInterval') withParser: parser startingFrom: startRule].

	(json includesKey: 'matchTree') ifTrue: [
		self assertMatchTree: (json at: 'matchTree') withParser: parser startingFrom: startRule].
