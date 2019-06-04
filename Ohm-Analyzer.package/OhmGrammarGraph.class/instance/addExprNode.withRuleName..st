as yet unclassified
addExprNode: anExpr withRuleName: aRuleName
	| strippedExpr |
	strippedExpr := self stripExpr: anExpr.

 	^ (exprNodes includesKey: strippedExpr)
		ifTrue: [exprNodes at: strippedExpr]
		ifFalse: [
			| exprNode |
			exprNode := OhmGrammarGraphNode new: strippedExpr withRuleName: aRuleName.
			exprNodes at: strippedExpr put: exprNode.
			self addEdges: exprNode.
			exprNode].
