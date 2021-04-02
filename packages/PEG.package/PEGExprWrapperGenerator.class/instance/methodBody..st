method body generation
methodBody: childName

	^ self methodBodyTemplate format: {childName . self arity}