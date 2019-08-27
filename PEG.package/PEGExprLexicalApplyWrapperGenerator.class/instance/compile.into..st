as yet unclassified
compile: aName into: aClass
	| methodString |

	"compile apply wrapper"
	methodString := (self class methodHead: aName) , Character lf, self class methodBodyMock.
	methodString := methodString format: {'apply_' , ruleName}.
	aClass compileSilently: methodString