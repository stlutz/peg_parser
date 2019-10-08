testing
testRange
	| rangeGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator newFrom: $4 to: $9.
	
	rangeGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123456789abc'.
	
	"prepare parser for parsing"
	parser instVarAt: 1 put: parseString. "string"
	parser instVarAt: 5 put: (PEGParserFailure newAt: 0). "rightmostFailure"
	

	parseResult := parser perform: #parse_rule: with: 1.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule: with: 2.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule: with: 4.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parse_rule: with: 8.
	self assert: parseResult startPos equals: 8.
	self assert: parseResult endPos equals: 9.
	parseResult := parser perform: #parse_rule: with: 9.
	self assert: parseResult startPos equals: 9.
	self assert: parseResult endPos equals: 10.
	parseResult := parser perform: #parse_rule: with: 10.
	self assert: parseResult equals: nil