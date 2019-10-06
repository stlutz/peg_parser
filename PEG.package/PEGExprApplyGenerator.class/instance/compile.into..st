as yet unclassified
compile: aName into: aClass
	| methodString |
	
	methodString := (self class methodHead: aName) , Character lf , self class methodBodyMock.
	methodString := methodString format: {'parse_' , ruleName . ruleName}.
	aClass compileSilently: methodString.