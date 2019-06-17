as yet unclassified
wrapper: anExpr withClass: aClass
	self checkExpr: anExpr.
	
	^ aClass new: anExpr