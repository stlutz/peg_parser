as yet unclassified
apply: anIdentifier
	(anIdentifier isKindOf: Symbol) ifFalse: [self error: 'Identifier must be a Symbol.'].
	
	^ applyExprs at: anIdentifier ifAbsentPut: [ PEGExprApply new: anIdentifier ].
