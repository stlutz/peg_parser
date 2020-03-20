evaluation
compile: aName into: aClass
	| methodString |

	"compile apply wrapper"
	methodString := (self methodHead: aName) , Character lf, self methodBodyTemplate.
	methodString := methodString format: {'apply_' , ruleName}.
	aClass compileSilently: methodString