as yet unclassified
addRule: anIdentifier withExpr: anExpr
	self checkExpr: anExpr.
	(rules includesKey: anIdentifier) ifTrue: [self error: 'Rule does already exist.'].

	rules at: anIdentifier put: anExpr