evaluation
compile: aName into: aClass
	| childNames methodString |
	childNames := self childNames: aName count: childGenerators size.
	childNames with: childGenerators do: [:childName :childGenerator |
		childGenerator compile: childName into: aClass].
	
	methodString := (self methodHead: aName asString) , Character lf , (self methodBodyTemplateWith: childGenerators size).
	methodString := methodString format: childNames.
	aClass compileSilently: methodString classified: self messageCategory