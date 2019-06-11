as yet unclassified
stripApplyExpr: expr
	^ expr class == OhmPExprApply
		ifTrue: [self stripApplyExpr: (grammar ruleNamed: expr ruleName)]
		ifFalse: [expr]