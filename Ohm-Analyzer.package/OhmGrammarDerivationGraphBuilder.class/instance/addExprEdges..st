as yet unclassified
addExprEdges: expr
	((expr class = OhmPExprAlt) or:
	[expr class = OhmPExprSeq]) ifTrue: [
		expr terms do: [:term |
			term := self addExpr: term.
			graph addEdgeFrom: expr to: term]].

	((expr class = OhmPExprLookahead) or:
	[expr class = OhmPExprNot] or:
	[expr class = OhmPExprMany] or:
	[expr class = OhmPExprOpt]) ifTrue: [
		| term |
		term := self addExpr: (expr term).
		graph addEdgeFrom: expr to: term].