as yet unclassified
addExpr: expr withName: name
	| strippedExpr |
	strippedExpr := self stripApplyExpr: expr.

	^ (graph includes: strippedExpr)
		ifTrue: [strippedExpr]
		ifFalse: [
			graph addNode: strippedExpr.
			graph nodeData: strippedExpr at: #name put: name.
			self addExprEdges: strippedExpr.
			strippedExpr.]