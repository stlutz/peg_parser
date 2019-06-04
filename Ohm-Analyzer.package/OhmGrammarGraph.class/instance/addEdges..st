as yet unclassified
addEdges: exprNode
	| anExpr actions |
	anExpr := exprNode expr.
	actions := Dictionary new.
	
	actions at: OhmPExprAlt put: [
		anExpr terms do: [:term |
			| termNode |
			termNode := self addExprNode: term.
			exprNode addAdjacentNode: termNode]].
	
	actions at: OhmPExprSeq put: [
		(anExpr terms isEmpty) ifFalse: [
		| termNode |
		termNode := self addExprNode: (anExpr terms at: 1).
		exprNode addAdjacentNode: termNode]].
	
	actions at: OhmPExprLookahead put: [
		| termNode |
		termNode := self addExprNode: (anExpr term).
		exprNode addAdjacentNode: termNode].
	actions at: OhmPExprNot put: (actions at: OhmPExprLookahead).
	actions at: OhmPExprMany put: (actions at: OhmPExprLookahead).
	actions at: OhmPExprOpt put: (actions at: OhmPExprLookahead).
	
	actions at: OhmPExprAnything put: [].
	actions at: OhmPExprCaseInsensitive put: [].
	actions at: OhmPExprPrimObject put: [].
	actions at: OhmPExprRange put: [].
	actions at: OhmPExprRegex put: [].
	actions at: OhmPExprString put: [].
	actions at: OhmPExprParam put: [].
	
	(actions at: anExpr class) value.
