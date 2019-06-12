as yet unclassified
addExpr: expr withName: name
	| strippedExpr strippedName |
	strippedExpr := self stripApplyExpr: expr.
	expr class = OhmPExprApply
		ifTrue: [strippedName := expr ruleName]
		ifFalse: [strippedName := name].

	^ (graph includes: strippedExpr)
		ifTrue: [strippedExpr]
		ifFalse: [
			graph addNode: strippedExpr.
			graph nodeData: strippedExpr at: #name put: strippedName.
			self addExprEdges: strippedExpr.
			strippedExpr.]