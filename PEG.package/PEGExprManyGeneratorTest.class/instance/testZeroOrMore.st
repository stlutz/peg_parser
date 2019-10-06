as yet unclassified
testZeroOrMore
	| rangeGenerator zeroOrMoreGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator newFrom: $0 to: $9.
	zeroOrMoreGenerator := PEGExprLexicalZeroOrMoreGenerator new: rangeGenerator.
	
	zeroOrMoreGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123abc123456'.
	
	"prepare parser for parsing"
	parser instVarAt: 1 put: parseString. "string"
	parser instVarAt: 5 put: (PEGParserFailure newAt: 0). "rightmostFailure"
		
	
	parseResult := parser perform: #parse_rule: with: 1.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule: with: 2.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule: with: 3.
	self assert: parseResult startPos equals: 3.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule: with: 4.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule: with: 5.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parse_rule: with: 7.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 13.
	