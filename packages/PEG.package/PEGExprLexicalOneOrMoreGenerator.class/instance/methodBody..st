method body generation
methodBody: childName

	| template |
	template := self arity = 1
					ifTrue: [self methodBodyTemplateForArity1]
					ifFalse: [self methodBodyTemplateForArityN].
	^ template format: {childName . self arity}