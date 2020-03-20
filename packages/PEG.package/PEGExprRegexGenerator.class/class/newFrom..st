as yet unclassified
newFrom: regexString
	| generator |
	generator := self new.
	generator regexString: regexString.
	generator literalDict at: #regexString put: regexString.
	^ generator