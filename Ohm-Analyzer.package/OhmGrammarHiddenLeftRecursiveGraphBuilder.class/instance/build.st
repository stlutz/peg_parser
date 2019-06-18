as yet unclassified
build
	derivationGraph := (OhmGrammarDerivationGraphBuilder new: grammar) build.
	self reduceDerivationGraph.

	^ super build