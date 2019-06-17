as yet unclassified
collection: listOfExprs withClass: aClass
	listOfExprs do: [:expr | self checkExpr: expr].

	^ aClass new: listOfExprs