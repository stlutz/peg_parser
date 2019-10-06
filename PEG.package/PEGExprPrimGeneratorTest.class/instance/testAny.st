as yet unclassified
testAny
	| anyGenerator parser parseString parseResult |
	anyGenerator := PEGExprAnyGenerator new.
	
	anyGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := 'a'.
	
	"prepare parser for parsing"
	parser instVarAt: 1 put: parseString. "string"
	parser instVarAt: 5 put: (PEGParserFailure newAt: 0). "rightmostFailure"	
	
	parseResult := parser parse_rule: 1.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 2.
	parseResult := parser parse_rule: 2.
	self assert: parseResult equals: nil