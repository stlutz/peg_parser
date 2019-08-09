as yet unclassified
checkExprGenerator: anExprGenerator
	(anExprGenerator isKindOf: PEGExprGenerator) ifFalse: [self error: 'Object is no PEGExprGenerator']