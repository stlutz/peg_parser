as yet unclassified
addExprEdges: expr
	expr class = OhmPExprApply ifTrue: [
		| childName childExpr|
		childName := expr ruleName.
		childExpr := self addExpr: (grammar ruleNamed: childName) withName: childName.
		graph addEdgeFrom: expr to: childExpr].

	expr class = OhmPExprAlt ifTrue: [
		expr terms do: [:term |
			term := self addExpr: term.
			graph addEdgeFrom: expr to: term]].

	expr class = OhmPExprSeq ifTrue: [
		(expr terms isEmpty) ifFalse: [
			| term |
			term := self addExpr: (expr terms at: 1).
			graph addEdgeFrom: expr to: term]].

	((expr class = OhmPExprLookahead) or:
	[expr class = OhmPExprNot] or:
	[expr class = OhmPExprMany] or:
	[expr class = OhmPExprOpt]) ifTrue: [
		| term |
		term := self addExpr: (expr term).
		graph addEdgeFrom: expr to: term].