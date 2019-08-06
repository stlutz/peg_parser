as yet unclassified
new: name from: startChar to: endChar
	| generator |
	generator := self new.
	generator name: name.
	generator literalDict at: #startChar put: startChar.
	generator literalDict at: #endChar put: endChar.
	^ generator