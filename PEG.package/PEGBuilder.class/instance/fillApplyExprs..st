as yet unclassified
fillApplyExprs: anExpr
	(filledExprs includes: anExpr) ifTrue: [^ nil].
	filledExprs add: anExpr.

	(anExpr isKindOf: PEGExprApply) ifTrue: [
		| childExpr |
		childExpr := rules at: anExpr identifier ifAbsent: [self error: 'Rule does not exist.'].
		anExpr childExpr: childExpr].

	(anExpr isKindOf: PEGExprCollection) ifTrue: [
		anExpr childExprs do: [:childExpr | self fillApplyExprs: childExpr]].

	(anExpr isKindOf: PEGExprWrapper) ifTrue: [
		self fillApplyExprs: anExpr childExpr].