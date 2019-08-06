as yet unclassified
compileInto: aClass
	| methodString |
	methodString := self class methodMockWith: childNames size.

	methodString := methodString format: {name} , childNames.
	aClass compileSilently: methodString