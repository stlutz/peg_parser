rule-definition
defineRule: aRuleName withExpr: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	ruleDefinitions at: aRuleName asSymbol put: anExprGenerator