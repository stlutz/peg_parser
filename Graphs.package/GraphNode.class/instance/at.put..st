as yet unclassified
at: ident put: value
	ident class == Symbol
		ifTrue: [^ data at: ident put: value]
