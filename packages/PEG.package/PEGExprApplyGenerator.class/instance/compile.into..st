evaluation
compile: aName into: aClass
	| methodString |
	methodString := (self methodHead: aName) , Character lf , self methodBodyTemplate.
	methodString := methodString format: {'parse_' , ruleName . ruleName}.
	aClass compileSilently: methodString classified: self messageCategory.