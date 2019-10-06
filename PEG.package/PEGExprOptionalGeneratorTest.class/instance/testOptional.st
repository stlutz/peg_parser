as yet unclassified
testOptional
	| stringGenerator optionalGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator newString: 'matchstring'.
	optionalGenerator := PEGExprOptionalGenerator new: stringGenerator.
	
	optionalGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123matchstring'.
	
	"prepare parser for parsing"
	parser instVarAt: 1 put: parseString. "string"
	parser instVarAt: 5 put: (PEGParserFailure newAt: 0). "rightmostFailure"
	
	
	parseResult := parser perform: #parse_rule: with: 1.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 1.
	parseResult := parser perform: #parse_rule: with: 2.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 2.
	parseResult := parser perform: #parse_rule: with: 4.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 15.
	parseResult := parser perform: #parse_rule: with: 5.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 5.