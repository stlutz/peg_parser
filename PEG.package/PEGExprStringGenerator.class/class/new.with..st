as yet unclassified
new: name with: matchString
	| generator |
	generator := self new.
	generator name: name.
	generator literalDict at: #matchString put: matchString.
	^ generator