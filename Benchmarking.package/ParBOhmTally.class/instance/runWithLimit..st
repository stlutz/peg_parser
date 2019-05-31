as yet unclassified
runWithLimit: limit
	| classes |
	limit = -1 ifTrue: [
		classes := Smalltalk allClasses copy.
		] ifFalse: [
		classes := Smalltalk allClasses copyFrom: 1 to: limit
		].
	
	messageTally := MessageTally new.
	
	messageTally spyEvery: 1 on: [	
		classes do: [:class |
			| methodCodes |
			methodCodes := class methodDict keys collect: [:key |
				(class sourceCodeAt: key) asString
				].
			
			methodCodes do: [:methodCode |
				parser match: methodCode startingFrom: #MethodDeclaration.
				]
			] displayingProgress: [:class | class name asString ].
	].
	^ messageTally.