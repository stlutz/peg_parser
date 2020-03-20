testing
testAlternatives
	"rule = 'matchstring' | [4-9]"
	| stringGenerator rangeGenerator alternativesGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator newString: 'matchstring'.
	rangeGenerator := PEGExprRangeGenerator newFrom: $4 to: $9.
	alternativesGenerator := PEGExprAlternativesGenerator new: {stringGenerator . rangeGenerator}.
	
	alternativesGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123456matchstring123test'.
	
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
	parseResult := parser perform: #parse_rule: with: 5.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 6.
	parseResult := parser perform: #parse_rule: with: 7.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 18.
	parseResult := parser perform: #parse_rule: with: 18.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule: with: 21.
	self assert: parseResult equals: nil.