as yet unclassified
extendRule: aRuleName withExpr: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	ruleExtensions at: aRuleName asSymbol put: anExprGenerator