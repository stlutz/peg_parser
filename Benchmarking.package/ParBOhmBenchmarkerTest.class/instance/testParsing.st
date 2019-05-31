as yet unclassified
testParsing
	| ob result |
	ob := ParBOhmBenchmarker new.
	result := ob run: 'test'.
	
	self assert: ParBParsingResult equals: result class.
	self assert: (result input) equals: 'test'.
	self assert: (result inputSize) equals: 4.
	self assert: OhmMatchResult equals: result result class.
	
	result := ob run: '{1 2 3}'.
	self assert: (result success) not.
	
	result := ob run: methodString.
	self assert: (result success).