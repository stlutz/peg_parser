as yet unclassified
testTrickyGrammar
	"
	A = 'a' A 'b' | 'ab'
	B = 'b' B 'c' | 'bc'
	C = !. | &(A !'b') 'a'* B !.
	"
	| g parserClass parser parseResult|
	g := PEGParserGenerator new.

	parserClass := PEGParser subclass: #TrickyGrammar
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: categoryName.
	
	"Spaces"
	(g star: (g string: ' ')) compile: #parse_spaces into: parserClass.
	(PEGExprApplyGenerator newWithRule: #spaces) compile: #apply_spaces into: parserClass.

	"Build Grammar"
	(g alt: {g seq: {g string: 'a' . g apply: #A . g string: 'b'} . g string: 'ab'}) compile: #parse_A into: parserClass.
	(g alt: {g seq: {g string: 'b' . g apply: #B . g string: 'c'} . g string: 'bc'}) compile: #parse_B into: parserClass.
	(g alt: {
		g not: g any .
		g seq: {
			g and: (g seq: {g apply: #A . g not: (g string: 'b')}) .
			g star: (g string: 'a') .
			g apply: #B .
			g not: g any
		}
	}) compile: #parse_D into: parserClass.
	"Add Applys"
	(PEGExprApplyGenerator newWithRule: #A) compile: #apply_A into: parserClass.
	(PEGExprApplyGenerator newWithRule: #B) compile: #apply_B into: parserClass.
	(PEGExprApplyGenerator newWithRule: #D) compile: #apply_D into: parserClass.
	
	parser := parserClass new.
	parseResult := parser parse: 'abc' startingFrom: #D.
	self assert: parseResult cst startPos equals: 1.
	self assert: parseResult cst endPos equals: 4.
	parseResult := parser parse: 'aaabbbccc' startingFrom: #D.
	self assert: parseResult cst startPos equals: 1.
	self assert: parseResult cst endPos equals: 10.
	
	parseResult := parser parse: 'aabbbccc' startingFrom: #D.
	self assert: parseResult failed equals: true.
	parseResult := parser parse: 'aaabbccc' startingFrom: #D.
	self assert: parseResult failed equals: true.
	parseResult := parser parse: 'aaabbbcc' startingFrom: #D.
	self assert: parseResult failed equals: true.
	parseResult := parser parse: 'aaaabbbccc' startingFrom: #D.
	self assert: parseResult failed equals: true.
	parseResult := parser parse: 'aaabbbbccc' startingFrom: #D.
	self assert: parseResult failed equals: true.
	parseResult := parser parse: 'aaabbbcccc' startingFrom: #D.
	self assert: parseResult failed equals: true.