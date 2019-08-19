as yet unclassified
compile: aName into: aClass
	| childName methodString methodIdentifier method |
	childName := self class childName: aName.
	childGenerator compile: childName into: aClass.
	
	methodString := (self class methodHead: aName asString) , Character lf , self class methodBodyMock.
	methodString := methodString format: {childName}.
	methodIdentifier := aClass compileSilently: methodString.
	method := aClass methodDict at: methodIdentifier.

	(1 to: method numLiterals) do: [:index |
		| literal |
		literal := method objectAt: index + 1.
		literal == #minSize
			ifTrue: [
				method objectAt: index + 1 put: minSize]]