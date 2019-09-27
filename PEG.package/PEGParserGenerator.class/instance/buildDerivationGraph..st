as yet unclassified
buildDerivationGraph: parserClass
	| derivationGraph addExprWithName getRuleDefinition addAllExprs |
	
	derivationGraph := DirectedGraph new.
	
	getRuleDefinition := [:ruleName |
		| currentClass expr |
		"Iterate through classes to get rule definition"
		currentClass := parserClass.
		[expr == nil] whileTrue: [
			currentClass == PEGParser ifTrue: [self error: ruleName , ' is not defined.'].
			expr := currentClass ruleDefinitions at: ruleName ifAbsent: [nil].
			currentClass := currentClass superclass].
		expr].
	
	addExprWithName := [:expr :name |
		(derivationGraph includes: expr) ifFalse: [
			derivationGraph addNode: expr.
			derivationGraph nodeData: expr at: #name put: name.
			
			"Apply"
			(expr isKindOf: PEGExprLexicalApplyWrapperGenerator) ifTrue: [
				| childExpr |
				childExpr := addExprWithName value: (getRuleDefinition value: expr ruleName) value: expr ruleName.
				derivationGraph addEdgeFrom: expr to: childExpr].
			
			"Collection"
			(expr isKindOf: PEGExprCollectionGenerator) ifTrue: [
				expr childGeneratorList do: [:childExpr |
					addExprWithName value: childExpr value: nil.
					derivationGraph addEdgeFrom: childExpr to: childExpr]].
			
			"Wrapped"
			(expr isKindOf: PEGExprWrapperGenerator) ifTrue: [
				addExprWithName value: (expr childGenerator) value: nil.
				derivationGraph addEdgeFrom: expr to: expr childGenerator]
			
			].
		"return expr"
		expr].
	
	addAllExprs := [:currentClass |
		currentClass == PEGParser ifFalse: [
			currentClass ruleDefinitions keysAndValuesDo: [:ruleName :expr |
				addExprWithName value: expr value: ruleName].
			addAllExprs value: currentClass superclass]].
	
	addAllExprs value: parserClass.
	
	parserClass derivationGraph: derivationGraph.