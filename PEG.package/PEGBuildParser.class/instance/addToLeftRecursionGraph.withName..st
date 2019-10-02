left recursion graph
addToLeftRecursionGraph: generator withName: ruleName
	(leftRecursionGraph includes: generator) ifFalse: [
		leftRecursionGraph addNode: generator.
		leftRecursionGraph nodeData: generator at: #name put: ruleName.
		
		"Apply"
		(generator isKindOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
			| childGenerator |
			childGenerator := self addToLeftRecursionGraph: (self getRuleDefinitionFrom: parserClass with: generator ruleName) withName: generator ruleName.
			leftRecursionGraph addEdgeFrom: generator to: childGenerator].
		
		"Alternatives"
		(generator isKindOf: PEGExprAlternativesGenerator) ifTrue: [
			generator childGeneratorList do: [:childGenerator |
				self addToLeftRecursionGraph: childGenerator.
				leftRecursionGraph addEdgeFrom: generator to: childGenerator]].
		
		"Sequence"
		((generator isKindOf: PEGExprLexicalSequenceGenerator) or:
		[generator isKindOf: PEGExprSyntacticalSequenceGenerator]) ifTrue: [
			| lastCanParseEpsilon stream |
			lastCanParseEpsilon := true.
			stream := generator childGeneratorList readStream.
			
			[lastCanParseEpsilon and: [stream atEnd not]]
				whileTrue: [
					| childGenerator |
					childGenerator := self addToLeftRecursionGraph: stream next.
					leftRecursionGraph addEdgeFrom: generator to: childGenerator.
					
					lastCanParseEpsilon := derivationGraph nodeData: childGenerator at: #parsesEpsilon]].
		
		"Lookahead Not ZeroOrMore OneOrMore Opt"
		(generator isKindOf: PEGExprWrapperGenerator) ifTrue: [
			self addToLeftRecursionGraph: generator childGenerator.
			leftRecursionGraph addEdgeFrom: generator to: generator childGenerator]
	].

	^ generator
