evaluation
compile: aName into: aClass
	| source |
	source := (self methodHead: aName asString) , Character lf , self methodBody.
	aClass compileSilently: source classified: self messageCategory.