as yet unclassified
edgeDataFrom: u to: v at: ident put: value
	| edgeData |
	edgeData := self edgeDataFrom: u to: v.
	^ edgeData at: ident put: value