as yet unclassified
edgeDataFrom: u to: v at: ident put: value
	| edgeData |
	edgeData := self edgeDataFrom: u to: v.
	ident class == Symbol
		ifTrue: [^ edgeData at: ident put: value]