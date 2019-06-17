as yet unclassified
addExprEdges: expr
	expr class = OhmPExprApply ifTrue: [
		| childName childExpr|
		childName := expr ruleName.
		childExpr := self addExpr: (grammar ruleNamed: childName) withName: childName.
		graph addEdgeFrom: expr to: childExpr].
	
	((expr class = OhmPExprAlt) or:
	[expr class = OhmPExprSeq]) ifTrue: [
		expr terms do: [:childExpr |
			childExpr := self addExpr: childExpr.
			graph addEdgeFrom: expr to: childExpr]].

	((expr class = OhmPExprLookahead) or:
	[expr class = OhmPExprNot] or:
	[expr class = OhmPExprMany] or:
	[expr class = OhmPExprOpt]) ifTrue: [
		| childExpr |
		childExpr := self addExpr: (expr term).
		graph addEdgeFrom: expr to: childExpr].