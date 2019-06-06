as yet unclassified
edgeDataFrom: u to: v at: ident
	| edgeData |
	edgeData := self edgeDataFrom: u to: v.
	^ edgeData at: ident