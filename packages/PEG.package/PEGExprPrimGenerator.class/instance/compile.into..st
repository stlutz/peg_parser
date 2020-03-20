evaluation
compile: aName into: aClass
	| methodString methodIdentifier method |
	methodString := (self methodHead: aName asString) , Character lf , self methodBodyTemplate.
	methodIdentifier := aClass compileSilently: methodString.
	method := aClass methodDict at: methodIdentifier.
	
	1 to: method numLiterals do: [:index | | literal |
		literal := method objectAt: index + 1.
		(literalDict includesKey: literal) ifTrue: [
			method objectAt: index + 1 put: (literalDict at: literal)]]