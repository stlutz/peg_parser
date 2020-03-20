evaluation
compile: aName into: aClass
	| childNames methodString |
	childNames := self class childNames: aName count: childGeneratorList size.
	childNames with: childGeneratorList do: [:childName :childGenerator |
		childGenerator compile: childName into: aClass].
	
	methodString := (self class methodHead: aName asString) , Character lf , (self class methodBodyMockWith: childGeneratorList size).
	methodString := methodString format: childNames.
	aClass compileSilently: methodString