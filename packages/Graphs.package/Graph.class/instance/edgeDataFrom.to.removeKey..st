as yet unclassified
edgeDataFrom: u to: v removeKey: ident
	| edgeData |
	edgeData := self edgeDataFrom: u to: v.
	^ edgeData removeKey: ident.
