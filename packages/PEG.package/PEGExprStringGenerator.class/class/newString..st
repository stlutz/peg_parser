instance creation
newString: matchString
	| generator |
	generator := self new.
	generator literalDict at: #matchString put: matchString.
	^ generator