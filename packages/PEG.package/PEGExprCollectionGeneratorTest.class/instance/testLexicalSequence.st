testing
testLexicalSequence
	" rule = [A-z] ([A-z] | [0-9] | '_')* ':' 
	[A-z] .. rule_1
	([A-z] | [0-9] | '_')*  .. rule_2	
	':' .. rule_3"
	| sequenceGenerator parser parseString parseResult |
	
	sequenceGenerator := PEGExprLexicalSequenceGenerator new: {
		PEGExprRangeGenerator newFrom: $A to: $z .
		PEGExprLexicalZeroOrMoreGenerator new: (
			PEGExprAlternativesGenerator new: {
				PEGExprRangeGenerator newFrom: $A to: $z .
				PEGExprRangeGenerator newFrom: $0 to: $9 .
				PEGExprStringGenerator newString: '_' } ) .
		PEGExprStringGenerator newString: ':' }.
	
	sequenceGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := 'test test: 123 123: Test: test_2123abc: 1'. "word positions: 1 6 12 16 21 27 41"
	
	"prepare parser for parsing"
	parser instVarAt: 1 put: parseString. "string"
	parser instVarAt: 5 put: (PEGParserFailure newAt: 0). "rightmostFailure"
	
	
	parseResult := parser perform: #parse_rule: with: 1.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule: with: 6.
	self assert: parseResult startPos equals: 6.
	self assert: parseResult endPos equals: 11.
	parseResult := parser perform: #parse_rule: with: 12.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule: with: 16.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule: with: 21.
	self assert: parseResult startPos equals: 21.
	self assert: parseResult endPos equals: 26.
	parseResult := parser perform: #parse_rule: with: 27.
	self assert: parseResult startPos equals: 27.
	self assert: parseResult endPos equals: 40.
	parseResult := parser perform: #parse_rule: with: 41.
	self assert: parseResult equals: nil.