evaluation
compile: aName into: aClass
	| methodString methodIdentifier method |
	methodString := (self methodHead: aName asString) , Character lf , self methodBodyTemplate.
	methodIdentifier := aClass compileSilently: methodString classified: self messageCategory.
	method := aClass methodDict at: methodIdentifier.
	self wrangleLiterals: method.