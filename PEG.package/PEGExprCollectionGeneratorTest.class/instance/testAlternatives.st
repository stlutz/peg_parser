as yet unclassified
testAlternatives
	"rule = 'matchstring' | [4-9]"
	| stringGenerator rangeGenerator alternativesGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator newString: 'matchstring'.
	rangeGenerator := PEGExprRangeGenerator newFrom: $4 to: $9.
	alternativesGenerator := PEGExprAlternativesGenerator new: {stringGenerator . rangeGenerator}.
	
	alternativesGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123456matchstring123test'.
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 6.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 7}.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 18.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 18}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 21}.
	self assert: parseResult equals: nil.