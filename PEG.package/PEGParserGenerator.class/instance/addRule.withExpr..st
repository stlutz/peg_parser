as yet unclassified
addRule: aRuleName withExpr: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	rules at: aRuleName asSymbol put: anExprGenerator