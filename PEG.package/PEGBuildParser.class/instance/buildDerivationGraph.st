derivation graph
buildDerivationGraph
	| currentClass |
	
	derivationGraph := DirectedGraph new.
	
	currentClass := parserClass.
	[currentClass == PEGParser] whileFalse: [
		currentClass ruleDefinitions keysAndValuesDo: [:ruleName :generator |
			self addToDerivationGraph: generator withName: ruleName].
		currentClass := currentClass superclass].