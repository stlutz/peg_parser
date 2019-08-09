as yet unclassified
testTrickyGrammar
	"
	A = 'a' A 'b' | 'ab'
	B = 'b' B 'c' | 'bc'
	C = !. | &(A !'b') 'a'* B !.
	"
	| g parserClass parser parseResult|
	g := PEGParserGenerator new.

	parserClass := Object subclass: #TrickyGrammar
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: categoryName.

	(g alt: {g seq: {g string: 'a' . g apply: #A . g string: 'b'} . g string: 'ab'}) compile: #A into: parserClass.
	(g alt: {g seq: {g string: 'b' . g apply: #B . g string: 'c'} . g string: 'bc'}) compile: #B into: parserClass.
	(g alt: {
		g not: g any .
		g seq: {
			g and: (g seq: {g apply: #A . g not: (g string: 'b')}) .
			g star: (g string: 'a') .
			g apply: #B .
			g not: g any
		}
	}) compile: #D into: parserClass.
	
	parser := parserClass new.
	parseResult := parser parse_D: 'abc' atPos: 1.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 4.
	parseResult := parser parse_D: 'aaabbbccc' atPos: 1.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 10.
	
	parseResult := parser parse_D: 'aabbbccc' atPos: 1.
	self assert: parseResult equals: nil.
	parseResult := parser parse_D: 'aaabbccc' atPos: 1.
	self assert: parseResult equals: nil.
	parseResult := parser parse_D: 'aaabbbcc' atPos: 1.
	self assert: parseResult equals: nil.
	parseResult := parser parse_D: 'aaaabbbccc' atPos: 1.
	self assert: parseResult equals: nil.
	parseResult := parser parse_D: 'aaabbbbccc' atPos: 1.
	self assert: parseResult equals: nil.
	parseResult := parser parse_D: 'aaabbbcccc' atPos: 1.
	self assert: parseResult equals: nil.