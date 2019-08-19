as yet unclassified
compile: aName into: aClass
	| newName methodString |
	newName := 'apply_' , ruleName.
	methodString := (self class methodHead: newName) , Character lf , self class methodBodyMock.
	methodString := methodString format: {'parse_' , ruleName}.
	aClass compileSilently: methodString.

	^ newName