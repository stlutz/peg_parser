as yet unclassified
compile: aName into: aClass
	| methodString |	
	methodString := (self methodHead: aName asString) , Character lf , self class methodBodyMock.
	methodString := methodString format: {ruleName}.
	aClass compileSilently: methodString