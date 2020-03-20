evaluation
compile: aName into: aClass
	| childNames methodString |
	childNames := self childNames: aName count: childGeneratorList size.
	childNames with: childGeneratorList do: [:childName :childGenerator |
		childGenerator compile: childName into: aClass].
	
	methodString := (self methodHead: aName asString) , Character lf , (self methodBodyTemplateWith: childGeneratorList size).
	methodString := methodString format: childNames.
	aClass compileSilently: methodString