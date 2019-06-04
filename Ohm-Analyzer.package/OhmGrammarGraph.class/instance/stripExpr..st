as yet unclassified
stripExpr: anExpr
	^ anExpr class == OhmPExprApply
		ifTrue: [
			self stripExpr: (grammar ruleNamed: anExpr ruleName)]
		ifFalse: [anExpr]