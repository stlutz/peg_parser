as yet unclassified
parse: aString startingFrom: anIdentifier
	| rootRule fullAST |
	rootRule := PEGExprApply new: anIdentifier childExpr: (rules at: anIdentifier).
	fullAST := (rootRule eval: aString at: 1) at: 1.
	^ fullAST