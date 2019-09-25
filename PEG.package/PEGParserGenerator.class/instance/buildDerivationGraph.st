as yet unclassified
buildDerivationGraph
	| graph addExprWithName |
	graph := DirectedGraph new.
	
	addExprWithName := [:expr :name |
		(graph includes: expr) ifFalse: [
			graph addNode: expr.
			graph nodeData: expr at: #name put: name.
			
			"Apply"
			(expr isKindOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
				| childExpr |
				childExpr := addExprWithName value: (ruleDefinitions at: expr ruleName) value: expr ruleName.
				graph addEdgeFrom: expr to: childExpr].
			
			"Collection"
			(expr isKindOf: PEGExprCollectionGenerator) ifTrue: [
				expr childGeneratorList do: [:childExpr |
					addExprWithName value: childExpr value: nil.
					graph addEdgeFrom: childExpr to: childExpr]].
			
			"Wrapped"
			(expr isKindOf: PEGExprWrapperGenerator) ifTrue: [
				addExprWithName value: (expr childGenerator) value: nil.
				graph addEdgeFrom: expr to: expr childGenerator]
			
			].
		"return expr"
		expr
		].
	
	ruleDefinitions keysAndValuesDo: [:ruleName :expr |
		addExprWithName value: expr value: ruleName].
	
	^ graph