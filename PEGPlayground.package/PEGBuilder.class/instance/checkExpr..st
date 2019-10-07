as yet unclassified
checkExpr: anExpr
	((anExpr isKindOf: PEGExpr) and: [(anExpr isMemberOf: PEGExpr) not])
		ifFalse: [self error: 'Expression needs to be subclass of PEGExpr.']