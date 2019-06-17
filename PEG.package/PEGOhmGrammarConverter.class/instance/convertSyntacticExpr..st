as yet unclassified
convertSyntacticExpr: expr
	^ builder seq: {builder apply: #spaces . self convertExpr: expr}