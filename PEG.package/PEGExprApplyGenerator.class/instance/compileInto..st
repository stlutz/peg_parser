as yet unclassified
compileInto: aClass
	| methodString |
	methodString := self class methodMock.
	methodString := methodString format: {name . childName}.
	aClass compileSilently: methodString