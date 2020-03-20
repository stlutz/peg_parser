evaluation
compile: aName into: aClass
	| childName methodString |
	childName := self childName: aName.
	childGenerator compile: childName into: aClass.
	
	methodString := (self methodHead: aName asString) , Character lf , self methodBodyTemplate.
	methodString := methodString format: {childName}.
	aClass compileSilently: methodString