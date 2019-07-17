as yet unclassified
collection: listOfExprs withClass: aClass
	(listOfExprs isKindOf: Array) ifFalse: [self error: 'Expression list must be of type Array'].
	listOfExprs do: [:expr | self checkExpr: expr].

	^ aClass new: listOfExprs