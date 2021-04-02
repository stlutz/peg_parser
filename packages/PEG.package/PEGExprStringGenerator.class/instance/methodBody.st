method body generation
methodBody

	| string template |
	string := self matchString.
	template := string size > 1
					ifTrue: [self methodBodyTemplateForString]
					ifFalse: [self methodBodyTemplateForCharacter].
	^ template format: {
		string storeString .
		string size storeString .
		string first storeString .
		(string size - 1) storeString }