as yet unclassified
testAlternatives
	"rule = 'matchstring' | [4-9]"
	| stringGenerator rangeGenerator alternativesGenerator applyGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator new: 'rule_1_1' with: 'matchstring'.
	rangeGenerator := PEGExprRangeGenerator new: 'rule_1_2' from: $4 to: $9.
	alternativesGenerator := PEGExprAlternativesGenerator new: 'rule_1' children: {'rule_1_1' . 'rule_1_2'}.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	stringGenerator compileInto: parserClass.
	rangeGenerator compileInto: parserClass.
	alternativesGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := '123456matchstring123test'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 6.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 7}.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 18.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 18}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 21}.
	self assert: parseResult equals: nil.