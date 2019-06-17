as yet unclassified
addExpr: expr withName: name
	(graph includes: expr) ifFalse: [
		graph addNode: expr.
			graph nodeData: expr at: #name put: name.
			self addExprEdges: expr].
	^ expr