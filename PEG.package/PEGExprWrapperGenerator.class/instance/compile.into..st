as yet unclassified
compile: aName into: aClass
	| childName methodString |
	childName := self class childName: aName.
	childName := childGenerator compile: childName into: aClass.
	
	methodString := (self class methodHead: aName asString) , Character lf , self class methodBodyMock.
	methodString := methodString format: {childName}.
	aClass compileSilently: methodString.

	^ aName