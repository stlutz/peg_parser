as yet unclassified
compile: aName into: aClass
	| applyRuleName applyMethodString wrapperMethodString |
	applyRuleName := 'apply_' , ruleName.
	
	"compile apply method"
	applyMethodString := (self class methodHead: applyRuleName) , Character lf , self class applyMethodBodyMock.
	applyMethodString := applyMethodString format: {'parse_' , ruleName}.
	aClass compileSilently: applyMethodString.
	
	"compile apply wrapper"
	wrapperMethodString := (self class methodHead: aName) , Character lf, self class wrapperMethodBodyMock.
	wrapperMethodString := wrapperMethodString format: {applyRuleName}.
	aClass compileSilently: wrapperMethodString