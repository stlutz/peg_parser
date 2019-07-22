as yet unclassified
fillApplyExprs
	applyExprs valuesDo: [:applyExpr | 
		| childExpr |
		childExpr := rules at: applyExpr identifier ifAbsent: [ self error: 'Rule does not exist' ].
		applyExpr childExpr: childExpr].
