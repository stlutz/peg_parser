tests
testSimpleApply
	"
	a = a 'b' | 'a'
	"
	| applySpacesGenerator spacesGenerator applyGenerator generator parser parseString parseResult |
	
	applySpacesGenerator := PEGExprApplyGenerator newWithRule: #spaces.
	spacesGenerator := PEGExprLexicalZeroOrMoreGenerator new: (PEGExprStringGenerator newString: ' ').
	applySpacesGenerator compile: #apply_spaces into: parserClass.
	spacesGenerator compile: #parse_spaces into: parserClass.
	
	applyGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #a.
	generator := PEGExprAlternativesGenerator new: {
		PEGExprLexicalSequenceGenerator new: {
			PEGExprLexicalApplyWrapperGenerator newWithRule: #a .
			PEGExprStringGenerator newString: 'b'} .
		PEGExprStringGenerator newString: 'a'}.
	
	applyGenerator compile: #apply_a into: parserClass.
	generator compile: #parse_a into: parserClass.
	parser := parserClass new.

	parseString := 'a'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 2.

	parseString := 'ab'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 3.

	parseString := 'abb'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 4.

	parseString := 'abbb'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 5.

	parseString := 'abbbb'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 6.