derivation graph
addToDerivationGraph: generator withName: ruleName
	(derivationGraph includes: generator) ifFalse: [
		derivationGraph addNode: generator.
		derivationGraph nodeData: generator at: #name put: ruleName.
		
		"Apply"
		(generator isKindOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
			| childGenerator |
			childGenerator := self addToDerivationGraph: (self getRuleDefinitionFrom: parserClass with: generator ruleName) withName: generator ruleName.
			derivationGraph addEdgeFrom: generator to: childGenerator].

		"Collection"
		(generator isKindOf: PEGExprCollectionGenerator) ifTrue: [
			generator childGenerators do: [:childGenerator |
				self addToDerivationGraph: childGenerator.
				derivationGraph addEdgeFrom: generator to: childGenerator]].

		"Wrapped"
		(generator isKindOf: PEGExprWrapperGenerator) ifTrue: [
			self addToDerivationGraph: generator childGenerator.
			derivationGraph addEdgeFrom: generator to: generator childGenerator]].
	
	^ generator