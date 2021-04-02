evaluation
compile: aName into: aClass
	| childName source |
	childName := self childName: aName.
	childGenerator compile: childName into: aClass.
	
	source := (self methodHead: aName asString) , Character lf , (self methodBody: childName).
	aClass compileSilently: source classified: self messageCategory