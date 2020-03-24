instance creation
newFrom: startChar to: endChar
	| generator |
	generator := self new.
	generator literalDict at: #startChar put: startChar.
	generator literalDict at: #endChar put: endChar.
	^ generator