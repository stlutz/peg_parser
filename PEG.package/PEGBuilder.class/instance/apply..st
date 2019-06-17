as yet unclassified
apply: anIdentifier
	(anIdentifier isKindOf: Symbol) ifFalse: [self error: 'Identifier must be a Symbol.'].

	^ PEGExprApply new: anIdentifier